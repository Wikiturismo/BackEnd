class Api::V1::ValorationsController < ApplicationController

  def renderValorations(sort, valoration, columns)
    if(params[:sort])
      options=["id ASC", "id DESC","val ASC", "val DESC", "created_at ASC", "created_at DESC", "userplace_id ASC", "userplace_id DESC"]
      if (options.include? sort)
          if(sort=="id ASC")
            sort="valorations.id ASC"
          elsif (sort=="id DESC")
            sort="valorations.id DESC"
          end
        valoration = valoration.order (sort)
        pages=valoration.total_entries/10 +1
        #render json: {data:town, pages: pages} ,each_serializer: TownSerializer, columns: columns || "all"
        render json: valoration ,each_serializer: ValorationSerializer, columns: columns || "all", root: "data", meta: {pages: pages}
      else
        render status: 400, json: {
          message: options
          }
      end
    else
    pages=valoration.total_entries/10 +1
    #render json: {data:town, pages: pages} ,each_serializer: TownSerializer, columns: columns || "all"
    render json: valoration ,each_serializer: ValorationSerializer, columns: columns || "all", root: "data", meta: {pages: pages}
    end
  end

  def index
    columns= params[:columns] ? params[:columns].split(",") : nil
    columns2=renameColumns(columns)
    valoration= columns ? Valoration.lawea(columns2) : Valoration.lawea(columns2)
    renderValorations(params[:sort],valoration,columns)
  end

  def count
    comment = Valoration.count
    render json: {
      data:{
        count: comment
      }
    }
  end

  def show
    columns= params[:columns] ? params[:columns].split(",") : nil
    columns2=renameColumns(columns)
    @valorations = Valoration.valorations_by_id(params[:id],columns2)
    render json: @valorations,each_serializer: ValorationSerializer, columns: columns || "all", root: "data"
  end

  def destroy
    @valoration = Valoration.valorations_by_id(params[:id])
    if @valoration == nil
      head 404
    else
      @valoration.destroy
      head 200
    end
  end

  def valorations_params
      params.require(:valoration).permit(:id, :val, :user_id, :place_id)
   end

   def update
     @valoration = Valoration.valorations_by_id(params[:id])
     if @valoration.update(valorations_params)
       @valoration = Valoration.valorations_by_id(params[:id])
       render json: @valoration, root: "data"
     else
       render json: @valoration.errors
     end
   end

  def create
    @valoration = Valoration.new(valorations_params)
    if @valoration.save
      render json: @valoration, root: "data", status: :created
    else
      render json: @valoration.errors
    end
  end

  def val
    columns= params[:columns] ? params[:columns]: nil
    columns2=renameColumns(columns)
    if(params[:q])
      valoration = Valoration.valorations_by_val(params[:q], params[:page],columns2)
      renderValorations(params[:sort],valoration,columns)
    else
      render status: 400,json: {
        message: "valoration(q) param missing"
        }
    end
  end

  def userplace
    columns= params[:columns] ? params[:columns]: nil
    columns2=renameColumns(columns)
    if(params[:user] && params[:place])
      valoration = Valoration.valorations_by_userplace(params[:user],params[:place],params[:page],columns2)
      renderValorations(params[:sort],valoration,columns)
    else
      render status: 400,json: {
        message: "Id Place param(q) missing"
        }
    end
  end

def renameColumns(columns)
    if columns
      aux=columns.split(",")
      for i in 0..aux.length
        aux[i]= aux[i]=="id"||aux[i]=="val"? "valorations."+aux[i] : aux[i]
      end
      return aux.join(",").chomp(",")
    else
      return columns
    end
  end

end
