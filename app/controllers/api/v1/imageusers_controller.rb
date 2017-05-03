class Api::V1::ImageusersController < ApplicationController

  def imageuser_params
      params.permit(:id, :image, :user_id)
   end

  def index
    @images = Imageuser.all
    render json: @images, root: "data"
  end


  def show
    @images = Imageuser.imageusers_by_id(params[:id])
    render json: @images.image.path, root: "data"
  end

  def destroy
    @image = Imageuser.imageusers_by_id(params[:id])
    if @image == nil
      #render status: 400
    else
      @image.destroy
      #respond_with(@post, :status => :create)
    end
  end

   def update
     @imageuser = Imageuser.imageusers_by_id(params[:id])
     if @imageuser.update_attributes(imageuser_params)
       @imageuser = Imageuser.imageusers_by_id(params[:id])
       render json: @imageuser, root: "data"
     else
       render json: @imageuser.errors
     end
   end

   def create
     upload = Imageuser.new(imageuser_params)
     if upload.save
       image_path=Imageuser.order("created_at").last
       upload.update(path: image_path.image.path)
       render json: upload, notice: 'Upload was successfully created.', status: :created, location: @picture
     else
       render upload.errors
     end
   end

  def byuser
    if(params[:q])
      name=params[:q]
      images = Imageuser.imageusers_by_user(name.tr('+', ' '),params[:page])
      render json: images, root: "data"
    else
      render status: 400,json: {
        message: "depart name(q) param missing"
        }
    end
  end
end
