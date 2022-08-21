class AddKeysToEventAttendings < ActiveRecord::Migration[7.0]
  def change
    add_column :event_attendings, :attendee_id, :integer, index: true
    add_foreign_key :event_attendings, :users, column: :attendee_id
    add_column :event_attendings, :attended_event_id, :integer, index: true
    add_foreign_key :event_attendings, :events, column: :attended_event_id
  end
end
