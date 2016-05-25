class AddLatitudeAndLongitudeToPub < ActiveRecord::Migration
  def change
    add_column :pubs, :latitude, :float
    add_column :pubs, :longitude, :float
  end
end
