class CommenttownsController < ApplicationController
  def index
    @commenttowns = Commenttown.all
    render json: @commenttowns, root: "data"
  end

  def show
    @commenttowns = Commenttown.commenttowns_by_id(params[:id])
    render json: @commenttowns, root: "data"
  end

  def destroy
    @comment = Commenttown.commenttowns_by_id(params[:id])
    if @comment == nil
      #render status: 400
    else
      @comment.destroy
      #render status: 200
    end
  end
  #create magico inservible
  def commenttown_params
      params.require(:commenttowns).permit(:id, :state, :content, :publicationdate, :town_id, :user_id, :depart_id)
   end

  def create
    @comment = Commenttown.new(commenttown_params)
    @comment.save
    redirect_to @comment
  end
#fin de la magia
  def state
    @commenttowns = Commenttown.commenttowns_by_state(params[:state])
    render json: @commenttowns, root: "data"
  end

  def date
    @commenttowns = Commenttown.commenttowns_by_publicationdate()
    render json: @commenttowns, root: "data"
  end

  def bytown
    nam=params[:townname]
    @commenttowns = Commenttown.commenttowns_by_town(nam.tr('+', ' '))
    render json: @commenttowns, root: "data"
  end

  def bydepart
    nam=params[:departname]
    @commenttowns = Commenttown.commenttowns_by_depart(nam.tr('+', ' '))
    render json: @commenttowns, root: "data"
  end

  def byuser
    nam=params[:username]
    @commenttowns = Commenttown.commenttowns_by_user(nam.tr('+', ' '))
    render json: @commenttowns, root: "data"
  end
end
