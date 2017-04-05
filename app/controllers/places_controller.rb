class PlacesController < ApplicationController
  def index
    @places = Place.all
    render json: @places, root: "data"
  end

  def show
    @places = Place.places_by_id(params[:id])
    render json: @towns, root: "data"
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

  def depart
    nam=params[:name]
    @places = Place.places_by_depart(nam.tr('+', ' '))
    render json: @places, root: "data"
  end

  def town
    nam=params[:name]
    @places = Place.places_by_town(nam.tr('+', ' '))
    render json: @places, root: "data"
  end
end
