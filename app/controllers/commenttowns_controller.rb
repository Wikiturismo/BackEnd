class CommenttownsController < ApplicationController
  def index
    @commenttowns = Commenttown.all
    render json: @commenttowns, root: "data"
  end

  def show
    @commenttowns = Commenttown.commenttowns_by_id(params[:id])
    render json: @commenttowns, root: "data"
  end

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
