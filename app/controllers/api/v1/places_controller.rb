class Api::V1::PlacesController < ApplicationController

  def renderPlaces(sort, place, columns)
    if(params[:sort])
      options=["id ASC", "id DESC", "name ASC", "name DESC", "created_at ASC", "created_at DESC", "town_id ASC", "town_id DESC", "depart_id ASC", "depart_id DESC", "user_id ASC", "user_id DESC", "state ASC", "state DESC", "ubication ASC", "ubication DESC", "kind ASC", "kind DESC", "valoration ASC", "valoration DESC" ,  "entrycost ASC", "entrycost DESC", "valone ASC", "valone DESC", "valtwo ASC", "valtwo DESC", "valthree ASC", "valthree DESC", "valfour ASC", "valfour DESC", "valfive ASC", "valfive DESC"]
      if (options.include? sort)
          if(sort=="id ASC")
            sort="places.id ASC"
          elsif (sort=="id DESC")
            sort="places.id DESC"
          end
        place = place.order (sort)
        pages=place.total_entries/10 +1
        render json: {data: place, pages: pages} ,each_serializer: PlaceSerializer, columns: columns || "all"
      else
        render status: 400, json: {
          message: options
          }
      end
    else
      pages=place.total_entries/10 +1
      render json: {data:place, pages: pages} ,each_serializer: PlaceSerializer, columns: columns || "all"
    end
  end

  def index
    columns= params[:columns] ? params[:columns].split(",") : nil
    columns2=renameColumns(columns)
    place= columns ? Place.all.select(columns2) : Place.all
    renderPlaces(params[:sort], place, columns)
  end

  def count
    comment = Place.count
    render json: {
      data:{
        count: comment
      }
    }
  end

  def show
    columns= params[:columns] ? params[:columns].split(",") : nil
    columns2=renameColumns(columns)
    @places = Place.places_by_id(params[:id], columns2)
    render json: @places,each_serializer: PlaceSerializer, columns: columns || "all", root: "data"
  end

  def top
    columns= params[:columns] ? params[:columns].split(",") : nil
    @places = Place.top
    render json: @places,each_serializer: PlaceSerializer, columns: columns || "all", root: "data"
  end

  def last
    columns= params[:columns] ? params[:columns].split(",") : nil
    @places = Place.recent
    render json: @places,each_serializer: PlaceSerializer, columns: columns || "all", root: "data"
  end

  def random
    columns= params[:columns] ? params[:columns].split(",") : nil
    columns2=renameColumns(columns)
    @places =   Place.random
    render json: @places,each_serializer: PlaceSerializer, columns: columns || "all", root: "data"
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
    columns= params[:columns] ? params[:columns]: nil
    columns2=renameColumns(columns)
    if(params[:q])
      nam=params[:q]
      place = Place.places_by_name(nam.tr('+', ' '),columns2)
      render json: place,each_serializer: PlaceSerializer, columns: columns || "all", root: "data"
    else
      render status: 400,json: {
        message: "Name param(q) missing"
        }
    end
  end

  def valoration
    columns= params[:columns] ? params[:columns]: nil
    columns2=renameColumns(columns)
    if(params[:q])
      nam=params[:q]
      place =  Place.places_by_valoration(params[:q],params[:page],columns2)
      renderPlaces(params[:sort],place,columns)
    else
      render status: 400,json: {
        message: "valoration(q) param missing"
        }
    end
  end

  def cost
    columns= params[:columns] ? params[:columns]: nil
    columns2=renameColumns(columns)
    if(params[:q])
      nam=params[:q]
      place =  Place.places_by_entrycost(params[:q],params[:page],columns2)
      renderPlaces(params[:sort],place,columns)
    else
      render status: 400,json: {
        message: "entrycost(q) param missing"
        }
    end
  end

  def date
    columns= params[:columns] ? params[:columns]: nil
    columns2=renameColumns(columns)
    if(params[:q])
      nam=params[:q]
      place =  Place.places_by_publicationdate(params[:q],params[:page],columns2)
      renderPlaces(params[:sort],place,columns)
    else
      render status: 400,json: {
        message: "date(q) param missing"
        }
    end
  end

  def kind
    columns= params[:columns] ? params[:columns]: nil
    columns2=renameColumns(columns)
    if(params[:q])
      kin=params[:q]
      place = Place.places_by_kind(kin.tr('+', ' '),params[:page],columns2)
      renderPlaces(params[:sort],place,columns)
    else
      render status: 400,json: {
        message: "kind param(q) missing"
        }
    end
  end

  def bydepart
    columns= params[:columns] ? params[:columns]: nil
    columns2=renameColumns(columns)
    if(params[:q])
      nam=params[:q]
      place = Place.places_by_depart(nam.tr('+', ' '),params[:page],columns2)
      renderPlaces(params[:sort],place,columns)
    else
      render status: 400,json: {
        message: "Name depart param(q) missing"
        }
    end
  end

  def bytown
      columns= params[:columns] ? params[:columns]: nil
      columns2=renameColumns(columns)
    if(params[:q])
      nam=params[:q]
      place = Place.places_by_town(nam.tr('+', ' '),params[:page],columns2)
      renderPlaces(params[:sort],place,columns)
    else
      render status: 400,json: {
        message: "Name depart param(q) missing"
        }
    end
  end

  def renameColumns(columns)
    if columns
      aux=columns.split(",")
      for i in 0..aux.length
        aux[i]= aux[i]=="id"||aux[i]=="state"||aux[i]=="name"||aux[i]=="description"||aux[i]=="ubication"||aux[i]=="address"||aux[i]=="kind"||aux[i]=="valoration"||aux[i]=="entrycost"? "places."+aux[i] : aux[i]
      end
      return aux.join(",").chomp(",")
    else
      return columns
    end
  end

end
