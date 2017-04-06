class DepartsController < ApplicationController
  def index
    @departs = Depart.all
    render json: @departs, root: "data"
  end

  def show
    @departs = Depart.departs_by_id(params[:id])
    render json: @departs, root: "data"
  end

  def destroy
    @depart = Depart.departs_by_id(params[:id])
    if @depart == nil
      #render status: 400
    else
      @depart.destroy
      #respond_with(@post, :status => :create)
    end
  end

  def name
    nam=params[:name]
    @departs = Depart.departs_by_name(nam.tr('+', ' '))
    render json: @departs, root: "data"
  end
end
