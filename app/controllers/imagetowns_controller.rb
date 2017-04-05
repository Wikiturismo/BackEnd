class ImagetownsController < ApplicationController
  def index
    @images = Imagetown.all
    render json: @images, root: "data"
  end

  def show
    @images = Imagetown.imagetowns_by_id(params[:id])
    render json: @images, root: "data"
  end

  def bytown
    name=params[:townname]
    @images = Imagetown.imagetowns_by_town(name.tr('+', ' '))
    render json: @images, root: "data"
  end
end
