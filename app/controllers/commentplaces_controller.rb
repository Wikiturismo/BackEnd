class CommentplacesController < ApplicationController
  def index
    @commentplaces = Commentplace.all
    render json: @commentplaces, root: "data"
  end

  def show
    @commentplaces = Commentplace.commentplaces_by_id(params[:id])
    render json: @commentplaces, root: "data"
  end

  def state
    @commentplaces = Commentplace.commentplaces_by_state(params[:state])
    render json: @commentplaces, root: "data"
  end

  def date
    @commentplaces = Commentplace.commentplaces_by_publicationdate()
    render json: @commentplaces, root: "data"
  end

  def byplace
    nam=params[:placename]
    @commentplaces = Commentplace.commentplaces_by_place(nam.tr('+', ' '))
    render json: @commentplaces, root: "data"
  end

  def bytown
    nam=params[:townname]
    @commentplaces = Commentplace.commentplaces_by_town(nam.tr('+', ' '))
    render json: @commentplaces, root: "data"
  end

  def bydepart
    nam=params[:departname]
    @commentplaces = Commentplace.commentplaces_by_depart(nam.tr('+', ' '))
    render json: @commentplaces, root: "data"
  end

  def byuser
    nam=params[:username]
    @commentplaces = Commentplace.commentplaces_by_user(nam.tr('+', ' '))
    render json: @commentplaces, root: "data"
  end
end
