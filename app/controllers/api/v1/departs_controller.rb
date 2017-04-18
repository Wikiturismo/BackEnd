class Api::V1::DepartsController < ApplicationController
  def index
    @departs = Depart.all
    render json: @departs, root: "data"
  end

  def show
    @departs = Depart.departs_by_id(params[:id])
    render json: @departs, root: "data"
  end

  def name
    nam=params[:name]
    @departs = Depart.departs_by_name(nam.tr('+', ' '))
    render json: @departs, root: "data"
  end
end
