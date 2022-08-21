class EventAttending < ApplicationRecord
    belongs_to :attended_events, class_name: "Event"
    belongs_to :event_attendees, class_name: "User"
end
