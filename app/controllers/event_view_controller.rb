class EventViewController < ApplicationController
    
    def index
        @user = User.all
        @events = Event.all
    end

    def show
        @user = User.all
        @event = Event.find(params[:id])
    end

    def attend
        @event = Event.find(params[:event_view_id])
        if @event.attendees.include?(current_user)
            redirect_to @event, notice: "You cannot join an event you're already attending"
        else
            @event.attendees.push(current_user)
            redirect_to event_view_path(@event), notice: "You've been added to this event!"
        end
      end
    
      def remove_attend
        @event = Event.find(params[:event_view_id])
        @event.attendees.delete(current_user)
        redirect_to event_view_path(@event), notice: "You have been removed from this event"
      end

      def update
        @event = current_user.created_events.find(params[:id])
        respond_to do |format|
          if @event.update(event_params)
            format.html { redirect_to user_events_url(@event), notice: "Event was successfully updated." }
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
        params.require(:event).permit(:date, :location, :title, :creator_id)
      end
end
