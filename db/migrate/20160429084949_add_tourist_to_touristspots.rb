class AddTouristToTouristspots < ActiveRecord::Migration
  def change
    add_column :touristspots, :tourist, :string
  end
end
