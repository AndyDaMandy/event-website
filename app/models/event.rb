class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    has_many :event_attendees, foreign_key: :attendee_id, class_name: "User"
    has_many :event_attendees, through: :event_attendings, source: :event_attendee
end
