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
      params.require(:imageplaces).permit(:id,:height, :width, :path, :depart_id, :imagen)
   end

   def update
     @imageplace = Imageplace.imageplaces_by_id(params[:id])
     @imageplace.update_attributes(imageplace_params)
     redirect_to @imageplace
   end

  def create
    @image = Imageplace.new(imageplace_params)
    @image.save
    redirect_to @image
  end

  def byplace
    name=params[:placename]
    @images = Imageplace.imageplaces_by_place(name.tr('+', ' '), params[:page])
    render json: @images, root: "data"
  end
end
