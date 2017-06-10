class Api::V1::CommentplacesController < ApplicationController

  def renderCommentplaces(sort, comment, columns)
    if(params[:sort])
      options=["id ASC", "id DESC", "state ASC", "state DESC", "created_at ASC", "created_at DESC", "town_id ASC", "town_id DESC", "place_id ASC", "place_id DESC", "user_id ASC", "user_id DESC", "depart_id ASC", "depart_id DESC"]
      if (options.include? sort)
          if(sort=="id ASC")
            sort="commentplaces.id ASC"
          elsif (sort=="id DESC")
            sort="commentplaces.id DESC"
          end
        comment = comment.order (sort)
        render json: comment,each_serializer: CommentplaceSerializer, columns: columns || "all", root: "data"
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
    columns2=renameColumns(columns)
    comment= columns ? comment = Commentplace.all.select(columns2) : comment = Commentplace.all
    renderCommentplaces(params[:sort], comment, columns)
  end

  def count
    comment = Commentplace.count
    render json: {
      data:{
        count: comment
      }
    }
  end

  def show
    columns= params[:columns] ? params[:columns]: nil
    columns2=renameColumns(columns)
    commentplaces = Commentplace.commentplaces_by_id(params[:id], columns2)
    render json: commentplaces, columns: columns || "all", root: "data"
  end

  def destroy
    @comment = Commentplace.commentplaces_by_id(params[:id])
    if @comment == nil
      head 404
    else
      @comment.destroy
      head 204
    end
  end

  def commentplace_params
      params.require(:commentplace).permit(:id, :state, :content, :town_id,:place_id, :user_id, :depart_id)
   end

  def create
    @comment = Commentplace.new(commentplace_params)
    if @comment.save
      render json: @comment, root: "data"
    else
      render json:@comment.errors
    end
  end

  def update
    @commentplace = Commentplace.commentplaces_by_id(params[:id])
    if @commentplace.update_attributes(commentplace_params)
      @commentplace = Commentplace.commentplaces_by_id(params[:id])
      render json: @commentplace, root: "data"
    else
      render json: @commentplace.errors
    end
  end

  def state
    columns= params[:columns] ? params[:columns]: nil
    columns2=renameColumns(columns)
    if(params[:q])
      comment = Commentplace.commentplaces_by_state(params[:q],params[:page],columns2)
      renderCommentplaces(params[:sort],comment,columns)
    else
      render status: 400,json: {
        message: "state(q) param missing"
        }
    end
  end

  def date
    columns= params[:columns] ? params[:columns]: nil
    columns2=renameColumns(columns)
    if(params[:q])
      comment = Commentplace.commentplaces_by_publicationdate(params[:page],columns2)
      renderCommentplaces(params[:sort],comment,columns)
    else
      render status: 400,json: {
        message: "date(q) param missing"
        }
    end
  end

  def byplace
    columns= params[:columns] ? params[:columns]: nil
    columns2=renameColumns(columns)
    if(params[:q])
      nam=params[:q]
      comment = Commentplace.commentplaces_by_place(nam.tr('+', ' '),params[:page],columns2)
      renderCommentplaces(params[:sort],comment,columns)
    else
      render status: 400,json: {
        message: "place name(q) param missing"
        }
    end
  end

  def bytown
    columns= params[:columns] ? params[:columns]: nil
    columns2=renameColumns(columns)
    if(params[:q])
      nam=params[:q]
      comment= Commentplace.commentplaces_by_town(nam.tr('+', ' '),params[:page],columns2)
      renderCommentplaces(params[:sort],comment,columns)
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
      comment = Commentplace.commentplaces_by_depart(nam.tr('+', ' '),params[:page],columns2)
      renderCommentplaces(params[:sort],comment,columns)
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
      comment = Commentplace.commentplaces_by_user(nam.tr('+', ' '),params[:page], columns2)
      renderCommentplaces(params[:sort],comment, columns)
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
        aux[i]= aux[i]=="id"||aux[i]=="state"||aux[i]=="content"? "commentplaces."+aux[i] : aux[i]
      end
      return aux.join(",").chomp(",")
    else
      return columns
    end
  end

end
