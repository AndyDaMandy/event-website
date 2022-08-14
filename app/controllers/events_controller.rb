class EventsController < ApplicationController
  def index
    @events = current_user.events.all
  end

  def show
    @event = current_user.events.find(params[:id])
  end

  def new
    @event = current_user.events.build
  end
  def edit
    @event = current_user.events.find(params[:id])
  end
  def create
  end

  def update
  end

  def destroy
  end

  def event_params
    params.require(:event).permit(:creator_id)
  end
end
