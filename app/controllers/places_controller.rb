class PlacesController < ApplicationController
  def index
    @places = Place.all
    render json: @places, root: "data"
  end

  def show
    @places = Place.places_by_id(params[:id])
    render json: @places, root: "data"
  end

  def top
    @places = Place.top
    render json: @places, root: "data"
  end

  def last
    @places = Place.recent
    render json: @places, root: "data"
  end

  def destroy
    @cplace = Place.places_by_id(params[:id])
    if @cplace == nil
      #render status: 400
    else
      @cplace.destroy
      #respond_with(@post, :status => :create)
    end
  end

  def places_params
      params.require(:places).permit(:id,:name, :state, :publicationdate, :description, :ubication, :address, :kind, :valoration, :entrycost, :town_id, :depart_id, :user_id)
   end

   def update
     @place = Place.places_by_id(params[:id])
     @place.update_attributes(places_params)
     redirect_to @place
   end

  def create
    @places = Place.new(places_params)
    @places.save
    redirect_to @places
  end

  def name
    nam=params[:name]
    @places = Place.places_by_name(nam.tr('+', ' '))
    render json: @places, root: "data"
  end

  def valoration
    @towns = Place.places_by_valoration(params[:valoration],params[:page])
    render json: @towns, root: "data"
  end

  def cost
    @towns = Place.places_by_entrycost(params[:entrycost],params[:page])
    render json: @towns, root: "data"
  end

  def date
    @towns = Place.places_by_publicationdate(params[:page])
    render json: @towns, root: "data"
  end

  def kind
    kin=params[:kind]
    @places = Place.places_by_kind(kin.tr('+', ' '),params[:page])
    render json: @places, root: "data"
  end

  def bydepart
    nam=params[:departname]
    @places = Place.places_by_depart(nam.tr('+', ' '),params[:page])
    render json: @places, root: "data"
  end

  def bytown
    nam=params[:townname]
    @places = Place.places_by_town(nam.tr('+', ' '),params[:page])
    render json: @places, root: "data"
  end
end
