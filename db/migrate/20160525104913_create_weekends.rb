class CreateWeekends < ActiveRecord::Migration
  def change
    create_table :weekends do |t|
      t.string :Hangouts
      t.string :name
      t.string :address
      t.string :description
      t.string :placesvisited

      t.timestamps null: false
    end
  end
end
