class Api::V1::ImagedepartsController < ApplicationController
  def index
    @images = Imagedepart.all
    render json: @images, root: "data"
  end

  def show
    @images = Imagedepart.imagedeparts_by_id(params[:id])
    render json: @images, root: "data"
  end

  def destroy
    @image = Imagedepart.imagedeparts_by_id(params[:id])
    if @image == nil
      #render status: 400
    else
      @image.destroy
      #respond_with(@post, :status => :create)
    end
  end

  def imagedepart_params
      params.require(:imagedeparts).permit(:id,:height, :width, :path, :depart_id, :imagen)
   end

   def update
     @imagedepart = Imagedepart.imagedeparts_by_id(params[:id])
     @imagedepart.update_attributes(imagedepart_params)
     redirect_to @imagedepart
   end

  def create
    @image = Imagedepart.new(imagedepart_params)
    @image.save
    redirect_to @image
  end

  def bydepart
    name=params[:departname]
    @images = Imagedepart.imagedeparts_by_depart(name.tr('+', ' '), params[:page])
    render json: @images, root: "data"
  end
end
