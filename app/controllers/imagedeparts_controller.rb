class ImagedepartsController < ApplicationController
  def index
    @images = Imagedepart.all
    render json: @images, root: "data"
  end

  def show
    @images = Imagedepart.imagedeparts_by_id(params[:id])
    render json: @images, root: "data"
  end

  def bydepart
    name=params[:departname]
    @images = Imagedepart.imagedeparts_by_depart(name.tr('+', ' '))
    render json: @images, root: "data"
  end
end
