class CreatePaintingsTable < ActiveRecord::Migration
  def change
    create_table :paintings do |t|
      t.string :name
      t.string :artist
      t.string :date
      t.string :description
      t.string :style
    end
  end
end
