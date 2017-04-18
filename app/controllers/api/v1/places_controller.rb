class Api::V1::PlacesController < ApplicationController
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

  def random
    @places = Place.places_by_random_id
    render json: @places, root: "data"
  end

  def destroy
    @cplace = Place.places_by_id(params[:id])
    if @cplace == nil
      head 400
    else
      @cplace.destroy
      head 204
    end
  end

  def places_params
      params.require(:place).permit(:id,:name, :state, :publicationdate, :description, :ubication, :address, :kind, :valoration, :entrycost, :town_id, :depart_id, :user_id)
   end

   def update
     @place = Place.places_by_id(params[:id])
     if @place.update_attributes(places_params)
       @place = Place.places_by_id(params[:id])
       render json: @place, root: "data"
     else
       render json: @place.errors
     end
   end

  def create
    @places = Place.new(places_params)
    if @places.save
      render json: @places, root: "data"
    else
      render json: @places.errors
    end
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
