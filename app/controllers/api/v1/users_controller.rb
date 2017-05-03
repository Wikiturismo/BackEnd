class Api::V1::UsersController < ApplicationController

  def renderUsers(sort, user, columns)
    if(params[:sort])
      options=["id ASC", "id DESC", "name ASC", "name DESC", "created_at ASC", "created_at DESC", "kind ASC", "kind DESC", "mail ASC", "mail DESC", "ubication ASC", "ubication DESC"]
      if (options.include? sort)
          if(sort=="id ASC")
            sort="users.id ASC"
          elsif (sort=="id DESC")
            sort="users.id DESC"
          end
        user = user.order (sort)
        render json: user,each_serializer: UserSerializer, columns: columns || "all", root: "data"
      else
        render status: 400, json: {
          message: options
          }
      end
    else
      render json: user, root: "data", columns: columns || "all"
    end
  end

  def index
    columns= params[:columns] ? params[:columns].split(",") : nil
    user= columns ? user = User.all.select(columns) : user = User.all
    renderUsers(params[:sort],user, columns)
  end


  def count
    comment = User.count
    render json: {
      data:{
        count: comment
      }
    }
  end

  def show
    columns= params[:columns] ? params[:columns]: nil
    columns2=renameColumns(columns)
    users = User.users_by_id(params[:id], columns2)
    render json: users, columns: columns || "all", root: "data"
  end

  def users_params
      params.require(:user).permit(:id,:name, :kind, :mail, :ubication)
   end

   def create
     @user = User.new(users_params)
     if @user.save
       render json: @user, root: "data"
     else
       render json: @user.errors
     end
   end

   def update
     @user = User.users_by_id(params[:id],nil)
     if @user.update_attributes(users_params)
       @user = User.users_by_id(params[:id],nil)
       render json: @user, root: "data"
     else
       render json: @user.errors
     end
   end

  def name
    columns= params[:columns] ? params[:columns]: nil
    columns2=renameColumns(columns)
    if(params[:q])
      nam=params[:q]
      user = User.users_by_name(nam.tr('+', ' '),params[:page],columns2)
      renderUsers(params[:sort],user,columns)
    else
      render status: 400,json: {
        message: "Name param(q) missing"
        }
    end
  end

  def mail
    columns= params[:columns] ? params[:columns]: nil
    columns2=renameColumns(columns)
    if(params[:q])
      email=params[:q]
      user = User.users_by_mail(email.tr('+', '.'),params[:page],columns2)
      renderUsers(params[:sort],user,columns)
    else
      render status: 400,json: {
        message: "mail param(q) missing"
        }
    end
  end

  def ukind
    columns= params[:columns] ? params[:columns]: nil
    columns2=renameColumns(columns)
    if(params[:q])
      nam=params[:q]
      user=User.users_by_kind(nam.tr('+', ' '),params[:page],columns2)
      renderUsers(params[:sort],user,columns)
    else
      render status: 400,json: {
        message: "kind(q) param missing"
        }
    end
  end

  def renameColumns(columns)
    if columns
      aux=columns.split(",")
      for i in 0..aux.length
        aux[i]= aux[i]=="id"||aux[i]=="state"||aux[i]=="content"? "users."+aux[i] : aux[i]
      end
      return aux.join(",").chomp(",")
    else
      return columns
    end
  end
end
