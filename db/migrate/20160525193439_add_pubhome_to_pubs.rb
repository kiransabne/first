class AddPubhomeToPubs < ActiveRecord::Migration
  def change
    add_column :pubs, :pubhome, :string
  end
end
