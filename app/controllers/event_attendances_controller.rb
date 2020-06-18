class EventAttendancesController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @event_attendance = EventAttendance.new
  end

  def create
    @event = Event.find(params[:event_id])

    # @event_attendance = @event.event_attendances.create(att_params)
    # redirect_to event_event_attendances_path  
    params[:event_attendance][:event_attendee_id].each do |x|
      @event_attendance = EventAttendance.new
      @event_attendance.event_attendee = User.find(x.to_i)
      @event_attendance.attended_event = @event
     

        if @event_attendance.save
          flash[:success] = "Event successfully created"
          
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
      
      
    end

    redirect_to user_path(@event.creator)
  end

  def show
    @event_attendance = EventAttendance.find(params[:id])
  end

  def att_params
    params.require(:event_attendance).permit(:event_attendee_id,:attended_event_id)
  end
end
