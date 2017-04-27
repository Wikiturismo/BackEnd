class Api::V1::PlacesController < ApplicationController

  def renderPlaces(sort, place)
    if(params[:sort])
      options=["id ASC", "id DESC", "name ASC", "name DESC", "created_at ASC", "created_at DESC", "town_id ASC", "town_id DESC", "depart_id ASC", "depart_id DESC", "user_id ASC", "user_id DESC", "state ASC", "state DESC", "ubication ASC", "ubication DESC", "kind ASC", "kind DESC", "valoration ASC", "valoration DESC" ,  "entrycost ASC", "entrycost DESC", "valone ASC", "valone DESC", "valtwo ASC", "valtwo DESC", "valthree ASC", "valthree DESC", "valfour ASC", "valfour DESC", "valfive ASC", "valfive DESC"]
      if (options.include? sort)
          if(sort=="id ASC")
            sort="places.id ASC"
          elsif (sort=="id DESC")
            sort="places.id DESC"
          end
        place = place.order (sort)
        render json: place, root: "data"
      else
        render status: 400, json: {
          message: options
          }
      end
    else
      render json: place, root: "data"
    end
  end

  def index
    place = Place.all
    renderPlaces(params[:sort], place)
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
      params.require(:place).permit(:id,:name, :state, :description, :ubication, :address, :kind, :valoration, :valone, :valtwo, :valthree, :valfour, :valfive, :entrycost, :town_id, :depart_id, :user_id)
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
    if(params[:q])
      nam=params[:q]
      place = Place.places_by_name(nam.tr('+', ' '))
      render json: place, root: "data"
    else
      render status: 400,json: {
        message: "Name param(q) missing"
        }
    end
  end

  def valoration
    if(params[:q])
      nam=params[:q]
      place =  Place.places_by_valoration(params[:q],params[:page])
      renderPlaces(params[:sort],place)
    else
      render status: 400,json: {
        message: "valoration(q) param missing"
        }
    end
  end

  def cost
    if(params[:q])
      nam=params[:q]
      place =  Place.places_by_entrycost(params[:q],params[:page])
      renderPlaces(params[:sort],place)
    else
      render status: 400,json: {
        message: "entrycost(q) param missing"
        }
    end
  end

  def date
    if(params[:q])
      nam=params[:q]
      place =  Place.places_by_publicationdate(params[:q],params[:page])
      renderPlaces(params[:sort],place)
    else
      render status: 400,json: {
        message: "date(q) param missing"
        }
    end
  end

  def kind
    if(params[:q])
      kin=params[:q]
      place = Place.places_by_kind(kin.tr('+', ' '),params[:page])
      render json: place, root: "data"
    else
      render status: 400,json: {
        message: "kind param(q) missing"
        }
    end
  end

  def bydepart
    if(params[:q])
      nam=params[:q]
      place = Place.places_by_depart(nam.tr('+', ' '),params[:page])
      render json: place, root: "data"
    else
      render status: 400,json: {
        message: "Name depart param(q) missing"
        }
    end
  end

  def bytown
    if(params[:q])
      nam=params[:q]
      place = Place.places_by_town(nam.tr('+', ' '),params[:page])
      render json: place, root: "data"
    else
      render status: 400,json: {
        message: "Name depart param(q) missing"
        }
    end
  end
end
