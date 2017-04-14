class Api::V1::SchedulesController < ApplicationController
  def index
    @schedule = Schedule.all
    render json: @schedule, root: "data"
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
    name=params[:placename]
    @schedule = Schedule.schedules_by_place(name.tr('+', ' '),params[:page])
    render json: @schedule, root: "data"
  end
end
