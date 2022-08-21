class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    belongs_to :attendee, class_name: "User", optional: true
    has_many :event_attendees, foreign_key: :attendee_id
    has_many :event_attendees, through: :event_attendings, source: :event_attendee
    validates :attendee, presence: true, allow_nil: true
end
