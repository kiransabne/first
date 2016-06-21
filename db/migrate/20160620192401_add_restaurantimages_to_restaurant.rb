class AddRestaurantimagesToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :restaurantimages, :string, array: true, default: []
  end
end
