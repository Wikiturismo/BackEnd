class SchedulesController < ApplicationController
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
      #render status: 400
    else
      @schedule.destroy
      #respond_with(@post, :status => :create)
    end
  end

  def schedules_params
      params.require(:schedules).permit(:id,:mondayopen, :mondayclose, :tuesdayopen, :tuesdayclose, :wednesdayopen, :wednesdayclose, :thursdayopen, :thursdayclose, :fridayopen, :fridayclose, :saturdayopen, :saturdayclose, :sundayopen, :sundayclose, :place_id)
   end

  def create
    @schedule = Schedule.new(schedules_params)
    @schedule.save
    redirect_to @schedule
  end

  def byplace
    name=params[:placename]
    @schedule = Schedule.schedules_by_place(name.tr('+', ' '))
    render json: @schedule, root: "data"
  end
end
