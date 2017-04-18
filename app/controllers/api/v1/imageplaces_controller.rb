class Api::V1::ImageplacesController < ApplicationController
  def index
    @images = Imageplace.all
    render json: @images, root: "data"
  end

  def show
    @images = Imageplace.imageplaces_by_id(params[:id])
    render json: @images, root: "data"
  end

  def destroy
    @image = Imageplace.imageplaces_by_id(params[:id])
    if @image == nil
      #render status: 400
    else
      @image.destroy
      #respond_with(@post, :status => :create)
    end
  end

  def imageplace_params
      params.require(:imageplace).permit(:id,:height, :width, :path, :depart_id)
   end

   def update
     @imageplace = Imageplace.imageplaces_by_id(params[:id])
     if @imageplace.update_attributes(imageplace_params)
       @imageplace = Imageplace.imageplaces_by_id(params[:id])
       render json: @imageplace, root: "data"
     else
       render json: @imageplace.errors
     end
   end

  def create
    @image = Imageplace.new(imageplace_params)
    if @image.save
      render json: @image, root: "data"
    else
      render json:@image.errors
    end
  end

  def byplace
    name=params[:placename]
    @images = Imageplace.imageplaces_by_place(name.tr('+', ' '), params[:page])
    render json: @images, root: "data"
  end
end
