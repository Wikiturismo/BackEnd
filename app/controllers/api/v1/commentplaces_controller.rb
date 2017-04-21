class Api::V1::CommentplacesController < ApplicationController

  def index
    @commentplaces = Commentplace.all
    render json: @commentplaces, root: "data"
  end

  def show
    @commentplaces = Commentplace.commentplaces_by_id(params[:id])
    render json: @commentplaces, root: "data"
  end

  def destroy
    @comment = Commentplace.commentplaces_by_id(params[:id])
    if @comment == nil
      head 400
    else
      @comment.destroy
      head 204
    end
  end

  def commentplace_params
      params.require(:commentplace).permit(:id, :state, :content, :town_id,:place_id, :user_id, :depart_id)
   end

  def create
    @comment = Commentplace.new(commentplace_params)
    if @comment.save
      render json: @comment, root: "data"
    else
      render json:@comment.errors
    end
  end

  def update
    @commentplace = Commentplace.commentplaces_by_id(params[:id])
    if @commentplace.update_attributes(commentplace_params)
      @commentplace = Commentplace.commentplaces_by_id(params[:id])
      render json: @commentplace, root: "data"
    else
      render json: @commentplace.errors
    end
  end

  def state
    @commentplaces = Commentplace.commentplaces_by_state(params[:state],params[:page])
    render json: @commentplaces, root: "data"
  end

  def date
    @commentplaces = Commentplace.commentplaces_by_publicationdate(params[:page])
    render json: @commentplaces, root: "data"
  end

  def byplace
    nam=params[:placename]
    @commentplaces = Commentplace.commentplaces_by_place(nam.tr('+', ' '),params[:page])
    render json: @commentplaces, root: "data"
  end

  def bytown
    nam=params[:townname]
    @commentplaces = Commentplace.commentplaces_by_town(nam.tr('+', ' '),params[:page])
    render json: @commentplaces, root: "data"
  end

  def bydepart
    nam=params[:departname]
    @commentplaces = Commentplace.commentplaces_by_depart(nam.tr('+', ' '),params[:page])
    render json: @commentplaces, root: "data"
  end

  def byuser
    nam=params[:username]
    @commentplaces = Commentplace.commentplaces_by_user(nam.tr('+', ' '),params[:page])
    render json: @commentplaces, root: "data"
  end
end
