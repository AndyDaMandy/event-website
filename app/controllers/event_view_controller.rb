class EventViewController < ApplicationController
    
    def index
        @user = User.all
        @events = Event.all
    end

    def show
        @user = User.all
        @event = Event.find(params[:id])
    end

end
