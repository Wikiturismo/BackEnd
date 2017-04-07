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

  def imagetowns_params
      params.require(:imagetowns).permit(:id,:height, :width, :path, :depart_id, :imagen)
   end

  def create
    @image = Imagetown.new(imagetowns_params)
    @image.save
    redirect_to @image
  end

  def bytown
    name=params[:townname]
    @images = Imagetown.imagetowns_by_town(name.tr('+', ' '))
    render json: @images, root: "data"
  end
end
