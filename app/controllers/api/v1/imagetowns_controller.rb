class Api::V1::ImagetownsController < ApplicationController

  def imagetown_params
      params.permit(:id, :image, :town_id)
   end

  def index
    @images = Imagetown.all
    render json: @images, root: "data"
  end

  def count
    comment = Imagetown.count
    render json: {
      data:{
        count: comment
      }
    }
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
     @upload = Imagetown.new(imagetown_params)
     if @upload.save
       render json: @upload, notice: 'Upload was successfully created.', status: :created, location: @picture
     else
       render @upload.errors
     end
   end

  def bytown
    if(params[:q])
      name=params[:q]
      images = Imagetown.imagetowns_by_town(name.tr('+', ' '),params[:page])
      render json: images, root: "data"
    else
      render status: 400,json: {
        message: "depart name(q) param missing"
        }
    end
  end
end
