class EventAttendancesController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @event_attendance = EventAttendance.new
  end

  def create
    @event = Event.find(params[:event_id])

    if params[:event_attendance]
      params[:event_attendance][:event_attendee_id].each do |x|
        @event_attendance = EventAttendance.new
        @event_attendance.event_attendee = User.find(x.to_i)
        @event_attendance.attended_event = @event
      end
      flash[:success] = 'Event successfully created'
      redirect_to user_path(@event.creator)
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  def show
    @event_attendance = EventAttendance.find(params[:id])
  end

  def att_params
    params.require(:event_attendance).permit(:event_attendee_id, :attended_event_id)
  end
end
