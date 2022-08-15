class ForeignKeys < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :creator_id, :integer, index: true
    add_foreign_key :events, :users, column: :creator_id
    add_column :events, :attendee_id, :integer, index: true
    add_foreign_key :events, :users, column: :attendee_id
  end
end
