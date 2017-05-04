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
      params.permit(:id, :image, :place_id)
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
     @upload = Imageplace.new(imageplace_params)
     if @upload.save
       render json: @upload, notice: 'Upload was successfully created.', status: :created, location: @picture
     else
       render @upload.errors
     end
   end

  def byplace
    if(params[:q])
      name=params[:q]
      images = Imageplace.imageplaces_by_place(name.tr('+', ' '), params[:page])
      render json: images, root: "data"
    else
      render status: 400,json: {
        message: "depart name(q) param missing"
        }
    end
  end
end
