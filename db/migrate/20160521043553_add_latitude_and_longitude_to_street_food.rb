class AddLatitudeAndLongitudeToStreetFood < ActiveRecord::Migration
  def change
    add_column :street_foods, :latitude, :float
    add_column :street_foods, :longitude, :float
  end
end
