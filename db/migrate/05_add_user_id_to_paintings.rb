class AddUserIdToPantings < ActiveRecord::Migration
  add_column :paintings, :user_id, :integer
end
