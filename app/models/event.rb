class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    belongs_to :attendee, class_name: "User", optional: true
    has_many :event_attendees, foreign_key: :attendee_id
    validates :attendee, presence: true, allow_nil: true
end
