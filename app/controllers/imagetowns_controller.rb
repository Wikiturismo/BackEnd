class ImagetownsController < ApplicationController
  def index
    @images = Imagetown.all
    render json: @images, root: "data"
  end

  def show
    @images = Imagetown.imagetowns_by_id(params[:id])
    render json: @images, root: "data"
  end

  def destroy
    @image = Imagetown.imagetowns_by_id(params[:id])
    if @image == nil
      #render status: 400
    else
      @image.destroy
      #respond_with(@post, :status => :create)
    end
  end

  def bytown
    name=params[:townname]
    @images = Imagetown.imagetowns_by_town(name.tr('+', ' '))
    render json: @images, root: "data"
  end
end
