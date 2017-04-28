class Api::V1::CommenttownsController < ApplicationController

  def renderCommenttowns(sort, comment,columns)
    if(params[:sort])
      options=["id ASC", "id DESC", "state ASC", "state DESC", "created_at ASC", "created_at DESC", "town_id ASC", "town_id DESC", "depart_id ASC", "depart_id DESC", "user_id ASC", "user_id DESC"]
      if (options.include? sort)
        if(sort=="id ASC")
          sort="commenttowns.id ASC"
        elsif (sort=="id DESC")
          sort="commenttowns.id DESC"
        end
        comment = comment.order (sort)
        render json: comment,each_serializer: CommenttownSerializer, columns: columns || "all", root: "data"
      else
        render status: 400, json: {
          message: options
          }
      end
    else
      render json: comment, root: "data", columns: columns || "all"
    end
  end

  def index
    columns= params[:columns] ? params[:columns].split(",") : nil
    comment= columns ? comment = Commenttown.all.select(columns) : comment = Commenttown.all
    renderCommenttowns(params[:sort], comment, columns)
  end

  def count
    comment = Commenttown.count
    render json: {
      data:{ count: comment }}
  end

  def show
    columns= params[:columns] ? params[:columns]: nil
    commenttowns = Commenttown.commenttowns_by_id(params[:id], columns)
    render json: commenttowns, columns: columns || "all", root: "data"
  end

  def destroy
    @comment = Commenttown.commenttowns_by_id(params[:id])
    if @comment == nil
      head 400
    else
      @comment.destroy
      head 204
    end
  end

  def commenttown_params
      params.require(:commenttown).permit(:id, :state, :content, :town_id, :user_id, :depart_id)
   end

   def create
     @comment = Commenttown.new(commenttown_params)
     if @comment.save
       render json: @comment, root: "data"
     else
       puts(commenttown_params)
       puts(render json:@comment.errors)
       render json:@comment.errors
     end
   end

   def update
     @commenttown = Commenttown.commenttowns_by_id(params[:id])
     if @commenttown.update_attributes(commenttown_params)
       @commenttown = Commenttown.commenttowns_by_id(params[:id])
       render json: @commenttown, root: "data"
     else
       render json: @commenttown.errors
     end
   end

  def state
    columns= params[:columns] ? params[:columns]: nil
    if(params[:q])
      comment = Commenttown.commenttowns_by_state(params[:q],params[:page],columns)
      renderCommenttowns(params[:sort],comment,columns)
    else
      render status: 400,json: {
        message: "state(q) param missing"
        }
    end
  end

  def date
    columns= params[:columns] ? params[:columns]: nil
    if(params[:q])
      comment = Commenttown.commenttowns_by_publicationdate(params[:page],columns)
      renderCommenttowns(params[:sort],comment,columns)
    else
      render status: 400,json: {
        message: "date(q) param missing"
        }
    end
  end

  def bytown
    columns= params[:columns] ? params[:columns]: nil
    columns2=renameColumns(columns)
    if(params[:q])
      nam=params[:q]
      comment= Commenttown.commenttowns_by_town(nam.tr('+', ' '),params[:page],columns2)
      renderCommenttowns(params[:sort],comment,columns)
    else
      render status: 400,json: {
        message: "town name(q) param missing"
        }
    end
  end

  def bydepart
    columns= params[:columns] ? params[:columns]: nil
    columns2=renameColumns(columns)
    if(params[:q])
      nam=params[:q]
      comment = Commenttown.commenttowns_by_depart(nam.tr('+', ' '),params[:page],columns2)
      renderCommenttowns(params[:sort],comment,columns)
    else
      render status: 400,json: {
        message: "depart name(q) param missing"
        }
    end
  end

  def byuser
    columns= params[:columns] ? params[:columns]: nil
    columns2=renameColumns(columns)
    if(params[:q])
      nam=params[:q]
      comment = Commenttown.commenttowns_by_user(nam.tr('+', ' '),params[:page], columns2)
      renderCommenttowns(params[:sort],comment, columns)
    else
      render status: 400,json: {
        message: "depart name(q) param missing"
        }
    end
  end

  def renameColumns(columns)
    if columns
      aux=columns.split(",")
      for i in 0..aux.length
        aux[i]= aux[i]=="id"||aux[i]=="state"||aux[i]=="content"? "commenttowns."+aux[i] : aux[i]
      end
      return aux.join(",").chomp(",")
    else
      return columns
    end
  end

end
