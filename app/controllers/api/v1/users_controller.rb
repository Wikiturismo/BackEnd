class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users, root: "data"
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
    nam=params[:name]
    @users = User.users_by_name(nam.tr('+', ' '))
    render json: @users, root: "data"
  end

  def mail
    email=params[:eemail]
    @users = User.users_by_mail(email.tr('+','.'))
    render json: @users, root: "data"
  end

  def ukind
      nam=params[:kin]
      @users = User.users_by_kind(nam.tr('+', ' '),params[:page])
      render json: @users, root: "data"
  end
end
