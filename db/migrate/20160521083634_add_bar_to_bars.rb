class AddBarToBars < ActiveRecord::Migration
  def change
    add_column :bars, :bar, :string
  end
end
