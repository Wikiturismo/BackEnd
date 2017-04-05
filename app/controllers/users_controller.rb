class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users, root: "data"
  end

  def show
    @users = User.users_by_id(params[:id])
    render json: @users, root: "data"
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
