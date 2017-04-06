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

  def name
    nam=params[:name]
    @places = Place.places_by_name(nam.tr('+', ' '))
    render json: @places, root: "data"
  end

  def valoration
    @towns = Place.places_by_valoration(params[:valoration])
    render json: @towns, root: "data"
  end

  def cost
    @towns = Place.places_by_entrycost(params[:entrycost])
    render json: @towns, root: "data"
  end

  def date
    @towns = Place.places_by_publicationdate()
    render json: @towns, root: "data"
  end

  def kind
    kin=params[:kind]
    @places = Place.places_by_kind(kin.tr('+', ' '))
    render json: @places, root: "data"
  end

  def bydepart
    nam=params[:departname]
    @places = Place.places_by_depart(nam.tr('+', ' '))
    render json: @places, root: "data"
  end

  def bytown
    nam=params[:townname]
    @places = Place.places_by_town(nam.tr('+', ' '))
    render json: @places, root: "data"
  end
end
