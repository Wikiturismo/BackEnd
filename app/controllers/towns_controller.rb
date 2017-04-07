class TownsController < ApplicationController
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
      #render status: 400
    else
      @town.destroy
      #respond_with(@post, :status => :create)
    end
  end

  def towns_params
      params.require(:towns).permit(:id,:name, :weather, :avertemper, :altitude, :demonym, :airport, :transpterminal, :depart_id)
   end

  def create
    @town = Town.new(towns_params)
    @town.save
    redirect_to @town
  end

  def name
    nam=params[:name]
    @towns = Town.towns_by_name(nam.tr('+', ' '))
    render json: @towns, root: "data"
  end

  def airport
    @towns = Town.towns_by_airport(params[:airport])
    render json: @towns, root: "data"
  end

  def terminal
    @towns = Town.towns_by_transpterminal(params[:transpterminal])
    render json: @towns, root: "data"
  end

  def temper
    @towns = Town.towns_by_avertemper(params[:avertemper])
    render json: @towns, root: "data"
  end

  def bydepart
    nam=params[:departname]
    @towns = Town.towns_by_depart(nam.tr('+', ' '))
    render json: @towns, root: "data"
  end
end
