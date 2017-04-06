class SchedulesController < ApplicationController
  def destroy
    @schedule = Schedule.schedules_by_id(params[:id])
    if @schedule == nil
      #render status: 400
    else
      @schedule.destroy
      #respond_with(@post, :status => :create)
    end
  end
end
