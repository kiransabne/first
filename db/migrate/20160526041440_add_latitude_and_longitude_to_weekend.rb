class AddLatitudeAndLongitudeToWeekend < ActiveRecord::Migration
  def change
    add_column :weekends, :latitude, :float
    add_column :weekends, :longitude, :float
  end
end
