class Api::V1::TownsController < ApplicationController
  def index
    @towns = Town.all
    render json: @towns, root: "data"
  end

  def show
    @towns = Town.towns_by_id(params[:id])
    render json: @towns, root: "data"
  end

  def destroy
    @town = Town.towns_by_id(params[:id])
    if @town == nil
      head 400
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
    nam=params[:name]
    @towns = Town.towns_by_name(nam.tr('+', ' '))
    render json: @towns, root: "data"
  end

  def airport
    @towns = Town.towns_by_airport(params[:airport], params[:page])
    render json: @towns, root: "data"
  end

  def terminal
    @towns = Town.towns_by_transpterminal(params[:transpterminal], params[:page])
    render json: @towns, root: "data"
  end

  def temper
    @towns = Town.towns_by_avertemper(params[:avertemper], params[:page])
    render json: @towns, root: "data"
  end

  def bydepart
    nam=params[:departname]
    @towns = Town.towns_by_depart(nam.tr('+', ' '), params[:page])
    render json: @towns, root: "data"
  end
end
