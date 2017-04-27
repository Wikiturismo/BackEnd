class Api::V1::TownsController < ApplicationController

  def renderTowns(sort, town)
    if(params[:sort])
      options=["id ASC", "id DESC", "name ASC", "name DESC", "created_at ASC", "created_at DESC", "weather ASC", "weather DESC", "depart_id ASC", "depart_id DESC", "avertemper ASC", "avertemper DESC", "altitude ASC", "altitude DESC", "airport ASC", "airport DESC", "transpterminal ASC", "transpterminal DESC"]
      if (options.include? sort)
          if(sort=="id ASC")
            sort="towns.id ASC"
          elsif (sort=="id DESC")
            sort="towns.id DESC"
          end
        town = town.order (sort)
        render json: town, root: "data"
      else
        render status: 400, json: {
          message: options
          }
      end
    else
      render json: town, root: "data"
    end
  end

  def index
    town = Town.all
    renderTowns(params[:sort],town)
  end

  def count
    comment = Town.all
    render json: {
      count: comment.count
    }
  end

  def show
    @towns = Town.towns_by_id(params[:id])
    render json: @towns, root: "data"
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
    if(params[:q])
      nam=params[:q]
      town = Town.towns_by_name(nam.tr('+', ' '))
      render json: town, root: "data"
    else
      render status: 400,json: {
        message: "Name param(q) missing"
        }
    end
  end

  def airport
    if(params[:q])
      nam=params[:q]
      town =  Town.towns_by_airport(params[:q], params[:page])
      renderTowns(params[:sort],town)
    else
      render status: 400,json: {
        message: "airport(q) param missing"
        }
    end
  end

  def terminal
    if(params[:q])
      town =  Town.towns_by_transpterminal(params[:q], params[:page])
      renderTowns(params[:sort],town)
    else
      render status: 400,json: {
        message: "terminal(q) param missing"
        }
    end
  end

  def temper
    if(params[:q])
      town =  Town.towns_by_avertemper(params[:q], params[:page])
      renderTowns(params[:sort],town)
    else
      render status: 400,json: {
        message: "temper(q) param missing"
        }
    end
  end

  def bydepart
    if(params[:q])
      nam=params[:q]
      town = Town.towns_by_depart(nam.tr('+', ' '),params[:page])
      renderTowns(params[:sort],town)
    else
      render status: 400,json: {
        message: "Name depart param(q) missing"
        }
    end
  end
end
