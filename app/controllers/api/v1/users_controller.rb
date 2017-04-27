class Api::V1::UsersController < ApplicationController

  def renderUsers(sort, user)
    if(params[:sort])
      options=["id ASC", "id DESC", "name ASC", "name DESC", "created_at ASC", "created_at DESC", "kind ASC", "kind DESC", "mail ASC", "mail DESC", "ubication ASC", "ubication DESC"]
      if (options.include? sort)
          if(sort=="id ASC")
            sort="users.id ASC"
          elsif (sort=="id DESC")
            sort="users.id DESC"
          end
        user = user.order (sort)
        render json: user, root: "data"
      else
        render status: 400, json: {
          message: options
          }
      end
    else
      render json: user, root: "data"
    end
  end

  def index
    user = User.all
    renderUsers(params[:sort],user)
  end

  def show
    @users = User.users_by_id(params[:id])
    render json: @users, root: "data"
  end

  def users_params
      params.require(:user).permit(:id,:name, :kind, :mail, :ubication)
   end

   def update
     @user = User.users_by_id(params[:id])
     if @user.update_attributes(users_params)
       @user = User.users_by_id(params[:id])
       render json: @user, root: "data"
     else
       render json: @user.errors
     end
   end

  def create
    @user = User.new(users_params)
    if @user.save
      render json: @user, root: "data"
    else
      render json: @user.errors
    end
  end

  def name
    if(params[:q])
      nam=params[:q]
      user = User.users_by_name(nam.tr('+', ' '))
      render json: user, root: "data"
    else
      render status: 400,json: {
        message: "Name param(q) missing"
        }
    end
  end

  def mail
    if(params[:q])
      email=params[:q]
      user = User.users_by_mail(email.tr('+', '.'))
      render json: user, root: "data"
    else
      render status: 400,json: {
        message: "mail param(q) missing"
        }
    end
  end

  def ukind
    if(params[:q])
      nam=params[:q]
      user=User.users_by_kind(nam.tr('+', ' '),params[:page])
      renderUsers(params[:sort],user)
    else
      render status: 400,json: {
        message: "kind(q) param missing"
        }
    end
  end
end
