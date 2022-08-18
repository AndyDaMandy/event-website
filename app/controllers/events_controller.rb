class EventsController < ApplicationController
  def index
    @events = current_user.created_events.all
  end

  def show
    @event = current_user.created_events.find(params[:id])
  end

  def new
    @event = current_user.created_events.build
  end
  def edit
    @event = current_user.created_events.find(params[:id])
  end
  def create
  end

  def update
  end

  def destroy
  end
  private
  
  def set_event
    @event = current_user.created_events
  end
end
