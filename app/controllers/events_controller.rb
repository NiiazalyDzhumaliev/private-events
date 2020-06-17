class EventsController < ApplicationController
    def new
        @event = Event.new
    end

    def show
        @event = Event.find(params[:id])        
    end

    def index
        @events = Event.all
    end

    def create
        @event = current_user.events.build(event_params)
        if @event.save
          flash[:success] = "Event successfully created"
          redirect_to events_path
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end
    
    private

    def event_params
        params.require(:event).permit(:title, :desc, :date, :location, :creator_id)        
    end
end
