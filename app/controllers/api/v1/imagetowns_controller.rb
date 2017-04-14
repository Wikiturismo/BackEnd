class Api::V1::ImagetownsController < ApplicationController
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
      params.require(:imagetown).permit(:id,:height, :width, :path, :depart_id)
   end

   def update
     @imagetown = Imagetown.imagetowns_by_id(params[:id])
     if @imagetown.update_attributes(imagetown_params)
       @imagetown = Imagetown.imagetowns_by_id(params[:id])
       render json: @imagetown, root: "data"
     else
       render json: @imagetown.errors
     end
   end

  def create
    @image = Imagetown.new(imagetowns_params)
    if @image.save
      render json: @image, root: "data"
    else
      render json: @image.errors
    end
  end

  def bytown
    name=params[:townname]
    @images = Imagetown.imagetowns_by_town(name.tr('+', ' '),params[:page])
    render json: @images, root: "data"
  end
end
