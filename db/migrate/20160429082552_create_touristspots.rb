class CreateTouristspots < ActiveRecord::Migration
  def change
    create_table :touristspots do |t|
      t.string :name
      t.string :location
      t.string :shortinfo
      t.string :description

      t.timestamps null: false
    end
  end
end
