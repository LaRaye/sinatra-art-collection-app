class CreateSculpturesTable < ActiveRecord::Migration[4.2]
  def change
    create_table :sculptures do |t|
      t.string :name
      t.string :artist
      t.string :date
      t.string :description
      t.string :style
    end
  end
end
