class EventViewController < ApplicationController
    
    def index
        @user = User.all
        @events = Event.all
    end

    def show
        @user = User.all
        @event = Event.find(params[:id])
    end
    def join
        @user = current_user
        @event = Event.find(params[:id])
    end
    def attend
        @user = current_user
        @event = Event.find(params[:id])
        if
    end

end
