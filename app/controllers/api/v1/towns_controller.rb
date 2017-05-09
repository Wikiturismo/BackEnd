class Api::V1::TownsController < ApplicationController

  def renderTowns(sort, town, columns)
    if(params[:sort])
      options=["id ASC", "id DESC", "name ASC", "name DESC", "created_at ASC", "created_at DESC", "weather ASC", "weather DESC", "depart_id ASC", "depart_id DESC", "avertemper ASC", "avertemper DESC", "altitude ASC", "altitude DESC", "airport ASC", "airport DESC", "transpterminal ASC", "transpterminal DESC"]
      if (options.include? sort)
          if(sort=="id ASC")
            sort="towns.id ASC"
          elsif (sort=="id DESC")
            sort="towns.id DESC"
          end
        town = town.order (sort)
        pages=town.total_entries/10 +1
        render json: {data:town, pages: pages} ,each_serializer: TownSerializer, columns: columns || "all"
      else
        render status: 400, json: {
          message: options
          }
      end
    else
      render json: town,each_serializer: TownSerializer, columns: columns || "all"
    end
  end

  def index
    columns= params[:columns] ? params[:columns].split(",") : nil
    columns2=renameColumns(columns)
    town= columns ? Town.all.select(columns2) : Town.all
    renderTowns(params[:sort],town,columns)
  end

  def count
    comment = Town.count
    render json: {
      data:{
        count: comment
      }
    }
  end

  def show
    columns= params[:columns] ? params[:columns].split(",") : nil
    columns2=renameColumns(columns)
    @towns = Town.towns_by_id(params[:id],columns2)
    render json: @towns,each_serializer: TownSerializer, columns: columns || "all", root: "data"
  end

  def destroy
    @town = Town.towns_by_id(params[:id])
    if @town == nil
      head 404
    else
      @town.destroy
      head 200
    end
  end

  def towns_params
      params.require(:town).permit(:id,:name, :weather, :avertemper, :altitude, :demonym, :airport, :transpterminal, :depart_id)
   end

   def update
     @town = Town.towns_by_id(params[:id])
     if @town.update(towns_params)
       @town = Town.towns_by_id(params[:id])
       render json: @town, root: "data"
     else
       render json: @town.errors
     end
   end

  def create
    @town = Town.new(towns_params)
    if @town.save
      render json: @town, root: "data"
    else
      render json: @town.errors
    end
  end

  def name
    columns= params[:columns] ? params[:columns]: nil
    columns2=renameColumns(columns)
    if(params[:q])
      nam=params[:q]
      town = Town.towns_by_name(nam.tr('+', ' '),columns)
      render json: town,each_serializer: TownSerializer, columns: columns || "all", root: "data"
    else
      render status: 400,json: {
        message: "Name param(q) missing"
        }
    end
  end

  def airport
    columns= params[:columns] ? params[:columns]: nil
    columns2=renameColumns(columns)
    if(params[:q])
      nam=params[:q]
      town =  Town.towns_by_airport(params[:q], params[:page],columns2)
      renderTowns(params[:sort],town,columns)
    else
      render status: 400,json: {
        message: "airport(q) param missing"
        }
    end
  end

  def terminal
    columns= params[:columns] ? params[:columns]: nil
    columns2=renameColumns(columns)
    if(params[:q])
      town =  Town.towns_by_transpterminal(params[:q], params[:page],columns2)
      renderTowns(params[:sort],town,columns)
    else
      render status: 400,json: {
        message: "terminal(q) param missing"
        }
    end
  end

  def temper
    columns= params[:columns] ? params[:columns]: nil
    columns2=renameColumns(columns)
    if(params[:q])
      town =  Town.towns_by_avertemper(params[:q], params[:page],columns2)
      renderTowns(params[:sort],town,columns)
    else
      render status: 400,json: {
        message: "temper(q) param missing"
        }
    end
  end

  def bydepart
    columns= params[:columns] ? params[:columns]: nil
    columns2=renameColumns(columns)
    if(params[:q])
      nam=params[:q]
      town = Town.towns_by_depart(nam.tr('+', ' '),params[:page],columns2)
      renderTowns(params[:sort],town,columns)
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
        aux[i]= aux[i]=="id"||aux[i]=="name"||aux[i]=="airport"||aux[i]=="transpterminal"||aux[i]=="weather"||aux[i]=="denonym"||aux[i]=="avertemper"||aux[i]=="altitude"? "towns."+aux[i] : aux[i]
      end
      return aux.join(",").chomp(",")
    else
      return columns
    end
  end

end
