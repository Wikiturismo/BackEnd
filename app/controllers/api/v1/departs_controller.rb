class Api::V1::DepartsController < ApplicationController
  def index
    @departs = Depart.all
    if(params[:sort])
      sort=params[:sort]
      options=["id DESC", "id ASC", "name DESC", "name ASC", "capital DESC", "capital ASC", "created_at ASC", "created_at DESC"]
      if (options.include? sort)
        @departs = @departs.order (sort)
        render json: @departs, root: "data"
      else
        render status: 400, json: {
          message: "Bad sort param, permited params: id DESC, id ASC, name DESC, name ASC, capital DESC, capital ASC"
          }
      end
    else
      render json: @departs, root: "data"
    end
  end

  def show
    @departs = Depart.departs_by_id(params[:id])
    render json: @departs, root: "data"
  end

  def name
    if(params[:q])
      nam=params[:q]
      @departs = Depart.departs_by_name(nam.tr('+', ' '))
      render json: @departs, root: "data"
    else
      render status: 400,json: {
        message: "Name param missing"
        }
    end
  end

end
