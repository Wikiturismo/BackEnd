class Api::V1::CommentplacesController < ApplicationController

  def renderCommentplaces(sort, comment)
    if(params[:sort])
      options=["id ASC", "id DESC", "state ASC", "state DESC", "created_at ASC", "created_at DESC", "town_id ASC", "town_id DESC", "place_id ASC", "place_id DESC", "user_id ASC", "user_id DESC", "depart_id ASC", "depart_id DESC"]
      if (options.include? sort)
          if(sort=="id ASC")
            sort="commentplaces.id ASC"
          elsif (sort=="id DESC")
            sort="commentplaces.id DESC"
          end
        comment = comment.order (sort)
        render json: comment, root: "data"
      else
        render status: 400, json: {
          message: options
          }
      end
    else
      render json: comment, root: "data"
    end
  end

  def index
    comment = Commentplace.all
    renderCommentplaces(params[:sort], comment)
  end

  def count
    comment = Commentplace.all
    render json: {
      count: comment.count
    }
  end

  def show
    @commentplaces = Commentplace.commentplaces_by_id(params[:id])
    render json: @commentplaces, root: "data"
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
    if(params[:q])
      comment = Commentplace.commentplaces_by_state(params[:q],params[:page])
      renderCommentplaces(params[:sort],comment)
    else
      render status: 400,json: {
        message: "state(q) param missing"
        }
    end
  end

  def date
    if(params[:q])
      comment = Commentplace.commentplaces_by_publicationdate(params[:page])
      renderCommentplaces(params[:sort],comment)
    else
      render status: 400,json: {
        message: "date(q) param missing"
        }
    end
  end

  def byplace
    if(params[:q])
      nam=params[:q]
      comment = Commentplace.commentplaces_by_place(nam.tr('+', ' '),params[:page])
      renderCommentplaces(params[:sort],comment)
    else
      render status: 400,json: {
        message: "place name(q) param missing"
        }
    end
  end

  def bytown
    if(params[:q])
      nam=params[:q]
      comment= Commentplace.commentplaces_by_town(nam.tr('+', ' '),params[:page])
      renderCommentplaces(params[:sort],comment)
    else
      render status: 400,json: {
        message: "town name(q) param missing"
        }
    end
  end

  def bydepart
    if(params[:q])
      nam=params[:q]
      comment = Commentplace.commentplaces_by_depart(nam.tr('+', ' '),params[:page])
      renderCommentplaces(params[:sort],comment)
    else
      render status: 400,json: {
        message: "depart name(q) param missing"
        }
    end
  end

  def byuser
    if(params[:q])
      nam=params[:q]
      comment = Commentplace.commentplaces_by_user(nam.tr('+', ' '),params[:page])
      renderCommentplaces(params[:sort],comment)
    else
      render status: 400,json: {
        message: "depart name(q) param missing"
        }
    end
  end
end
