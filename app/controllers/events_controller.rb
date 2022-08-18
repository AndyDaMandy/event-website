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

  # POST /moods or /moods.json
  def create
    @event = current_user.created_events.build(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to event_url(@event), notice: "Mood was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    @event = current_user.created_events.find(params[:id])
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to mood_url(@event), notice: "Mood was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moods/1 or /moods/1.json
  def destroy
    @event = current_user.created_events.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to event_url, notice: "Mood was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  private
  
  def set_event
    @event = current_user.created_events
  end
  def event_params
    params.require(:created_vents).permit(:date, :location, :creator_id)
  end
end
