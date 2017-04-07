class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users, root: "data"
  end

  def show
    @users = User.users_by_id(params[:id])
    render json: @users, root: "data"
  end

  def users_params
      params.require(:users).permit(:id,:name, :kind, :mail, :ubication, :registdate)
   end

  def create
    @users = User.new(users_params)
    @users.save
    redirect_to @users
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
      @users = User.users_by_kind(nam.tr('+', ' '))
      render json: @users, root: "data"
  end
end
