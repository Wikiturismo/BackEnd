class TownsController < ApplicationController
  def index
    @towns = Town.all
    render json: @towns, root: "data"
  end

  def show
    @towns = Town.towns_by_id(params[:id])
    render json: @towns, root: "data"
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
