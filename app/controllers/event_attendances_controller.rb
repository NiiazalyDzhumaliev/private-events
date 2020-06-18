class EventAttendancesController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @event_attendance = EventAttendance.new
  end

  def create
    @event = Event.find(params[:event_id])
    
    @event_attendance = @event.event_attendances.create(comment_params)
    redirect_to article_path(@article)       
  end

  def att_params
    params.require(:event_attendance).permit(:event_attendee_id,:attended_event_id)
  end
end
