class Api::V1::CommenttownsController < ApplicationController

  def renderCommenttowns(sort, comment)
    if(params[:sort])
      options=["id ASC", "id DESC", "state ASC", "state DESC", "created_at ASC", "created_at DESC", "town_id ASC", "town_id DESC", "depart_id ASC", "depart_id DESC", "user_id ASC", "user_id DESC"]
      if (options.include? sort)
        if(sort=="id ASC")
          sort="commenttowns.id ASC"
        elsif (sort=="id DESC")
          sort="commenttowns.id DESC"
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
    comment = Commenttown.all
    renderCommenttowns(params[:sort], comment)
  end

  def show
    @commenttowns = Commenttown.commenttowns_by_id(params[:id])
    render json: @commenttowns, root: "data"
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

   def update
     @commenttown = Commenttown.commenttowns_by_id(params[:id])
     if @commenttown.update_attributes(commenttown_params)
       @commenttown = Commenttown.commenttowns_by_id(params[:id])
       render json: @commenttown, root: "data"
     else
       render json: @commenttown.errors
     end
   end

  def create
    @comment = Commenttown.new(commenttown_params)
    @comment.save
    render json: @comment, root: "data"
  end
  def state
    if(params[:q])
      comment = Commenttown.commenttowns_by_state(params[:q],params[:page])
      renderCommenttowns(params[:sort],comment)
    else
      render status: 400,json: {
        message: "state(q) param missing"
        }
    end
  end

  def date
    if(params[:q])
      comment = Commenttown.commenttowns_by_publicationdate(params[:page])
      renderCommenttowns(params[:sort],comment)
    else
      render status: 400,json: {
        message: "date(q) param missing"
        }
    end
  end

  def bytown
    if(params[:q])
      nam=params[:q]
      comment= Commenttown.commenttowns_by_town(nam.tr('+', ' '),params[:page])
      renderCommenttowns(params[:sort],comment)
    else
      render status: 400,json: {
        message: "town name(q) param missing"
        }
    end
  end

  def bydepart
    if(params[:q])
      nam=params[:q]
      comment = Commenttown.commenttowns_by_depart(nam.tr('+', ' '),params[:page])
      renderCommenttowns(params[:sort],comment)
    else
      render status: 400,json: {
        message: "depart name(q) param missing"
        }
    end
  end

  def byuser
    if(params[:q])
      nam=params[:q]
      comment = Commenttown.commenttowns_by_user(nam.tr('+', ' '),params[:page])
      renderCommenttowns(params[:sort],comment)
    else
      render status: 400,json: {
        message: "depart name(q) param missing"
        }
    end
  end
end
