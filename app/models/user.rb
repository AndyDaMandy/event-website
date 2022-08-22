class User < ApplicationRecord
  has_many :created_events, foreign_key: "creator_id", class_name: "Event"
  has_many :event_attendings, foreign_key: "attendee_id"
  has_many :attending_events, through: :event_attendings, source: :attendee
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
