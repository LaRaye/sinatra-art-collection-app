class AddUserToSculptures < ActiveRecord::Migration
  add_column :sculptures, :user_id, :integer
end
