class Api::V1::DepartsController < ApplicationController
  def index
    columns= params[:columns] ? params[:columns]: nil
    @departs= columns ? Depart.all.select(columns) : Depart.all
    if(params[:sort])
      sort=params[:sort]
      options=["id DESC", "id ASC", "name DESC", "name ASC", "capital DESC", "capital ASC", "created_at ASC", "created_at DESC"]
      if (options.include? sort)
        @departs = @departs.order (sort)
        render json: @departs,each_serializer: DepartSerializer, columns: columns || "all", root: "data"
      else
        render status: 400, json: {
          message: "Bad sort param, permited params: id DESC, id ASC, name DESC, name ASC, capital DESC, capital ASC"
          }
      end
    else
      render json: @departs,each_serializer: DepartSerializer, columns: columns || "all", root: "data"
    end
  end

  def show
    columns= params[:columns] ? params[:columns]: nil
    @departs = Depart.departs_by_id(params[:id],columns)
    render json: @departs,each_serializer: DepartSerializer, columns: columns || "all", root: "data"
  end

  def name
    columns= params[:columns] ? params[:columns]: nil
    if(params[:q])
      nam=params[:q]
      if (nam=="")
        render json: {
          data:[]
        }
      else
        nam=I18n.transliterate(nam).tr('+', ' ')
        @departs = Depart.departs_by_name(nam,columns)
        render json: @departs,each_serializer: DepartSerializer, columns: columns || "all", root: "data"
      end
    else
      render status: 400,json: {
        message: "Name param(q) missing"
        }
    end
  end

end
