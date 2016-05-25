class AddPubprofileToPubs < ActiveRecord::Migration
  def change
    add_column :pubs, :pubprofile, :string
  end
end
