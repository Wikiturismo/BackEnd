class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users, root: "data"
  end

  def show
    @users = User.users_by_id(params[:id])
    render json: @users, root: "data"
  end

  def destroy
    @users = User.users_by_id(params[:id])
    if @users == nil
      #render status: 400
    else
      @users.destroy
      #render status: 200
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
      @users = User.users_by_kind(nam.tr('+', ' '))
      render json: @users, root: "data"
  end
end
