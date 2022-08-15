class AddKeysToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :created_events_id, :integer, index: true
    add_foreign_key :users, :events, column: :created_events_id
    add_column :users, :attended_events_id, :integer, index: true
    add_foreign_key :users, :events, column: :attended_events_id
  end
end
