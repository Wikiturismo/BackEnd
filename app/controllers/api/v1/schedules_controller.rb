class Api::V1::SchedulesController < ApplicationController

  def renderSchedules(sort, schedule)
    if(params[:sort])
      options=["id ASC", "id DESC", "created_at ASC", "created_at DESC", "place_id ASC", "place_id DESC"]
      if (options.include? sort)
          if(sort=="id ASC")
            sort="schedules.id ASC"
          elsif (sort=="id DESC")
            sort="schedules.id DESC"
          end
        schedule = schedule.order (sort)
        pages=schedule.total_entries/10 +1
        render json: {data:schedule, pages: pages} , root: "data"
      else
        render status: 400, json: {
          message: options
          }
      end
    else
      pages=schedule.total_entries/10 +1
      render json: {data:schedule, pages: pages} , root: "data" root: "data"
    end
  end

  def index
    schedule = Schedule.all
    renderSchedules(params[:sort],schedule)
  end

  def show
    @schedule = Schedule.schedules_by_id(params[:id])
    render json: @schedule, root: "data"
  end

  def destroy
    @schedule = Schedule.schedules_by_id(params[:id])
    if @schedule == nil
      head 400
    else
      @schedule.destroy
      head 204
    end
  end

  def schedules_params
      params.require(:schedule).permit(:id,:mondayopen, :mondayclose, :tuesdayopen, :tuesdayclose, :wednesdayopen, :wednesdayclose, :thursdayopen, :thursdayclose, :fridayopen, :fridayclose, :saturdayopen, :saturdayclose, :sundayopen, :sundayclose, :place_id)
   end

   def update
     @schedule = Schedule.schedules_by_id(params[:id])
     if @schedule.update_attributes(schedules_params)
       @schedule = Schedule.schedules_by_id(params[:id])
       render json: @schedule, root: "data"
     else
       render json: @schedule.errors
     end
   end

  def create
    @schedule = Schedule.new(schedules_params)
    if @schedule.save
      render json: @schedule, root: "data"
    else
      render json: @schedule.errors
    end
  end

  def byplace
    if(params[:q])
      nam=params[:q]
      schedule = Schedule.schedules_by_place(nam.tr('+', ' '),params[:page])
      renderSchedules(params[:sort],schedule)
    else
      render status: 400,json: {
        message: "place name(q) param missing"
        }
    end
  end
end
