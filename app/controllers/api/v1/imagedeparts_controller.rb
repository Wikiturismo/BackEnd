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
      params.permit(:id,:image, :depart_id)
   end

   def update
     @imagedepart = Imagedepart.imagedeparts_by_id(params[:id])
     if @imagedepart.update_attributes(imagedepart_params)
       @imagedepart = Imagedepart.imagedeparts_by_id(params[:id])
       render json: @imagedepart, root: "data"
     else
       render json: @imagedepart.errors
     end
   end

   def create
     upload = Imagedepart.new(imagedepart_params)
     if upload.save
       render json: upload, notice: 'Upload was successfully created.', status: :created, location: @picture
     else
       render upload.errors
     end
   end

  def bydepart
    if(params[:q])
      name=params[:q]
      images = Imagedepart.imagedeparts_by_depart(name.tr('+', ' '), params[:page])
      render json: images, root: "data"
    else
      render status: 400,json: {
        message: "depart name(q) param missing"
        }
    end
  end
end
