class AddKeysToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :created_events, :integer, index: true
  end
end
