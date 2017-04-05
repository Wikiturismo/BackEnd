class ImageplacesController < ApplicationController
  def index
    @images = Imageplace.all
    render json: @images, root: "data"
  end

  def show
    @images = Imageplace.imagedeplaces_by_id(params[:id])
    render json: @images, root: "data"
  end

  def byplace
    name=params[:placename]
    @images = Imageplace.imageplaces_by_place(name.tr('+', ' '))
    render json: @images, root: "data"
  end
end
