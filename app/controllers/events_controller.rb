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
        @event = Event.new(event_params)
        if @event.save
          flash[:success] = "Event successfully created"
          redirect_to @event
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end
    
    private

    def event_params
        params.require(:events).permit(:title, :desc, :date, :location, :creator_id)        
    end
end
