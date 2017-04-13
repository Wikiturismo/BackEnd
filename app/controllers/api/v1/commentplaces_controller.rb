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
      params.require(:commenttowns).permit(:id, :state, :content, :publicationdate, :town_id,:place_id, :user_id, :depart_id)
   end

  def create
    @comment = Commentplace.new(commentplace_params)
    @comment.save
    redirect_to @comment
  end

  def update
    @commentplace = Commentplace.commentplaces_by_id(params[:id])
    @commentplace.update_attributes(commentplace_params)
    redirect_to @commentplace
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
