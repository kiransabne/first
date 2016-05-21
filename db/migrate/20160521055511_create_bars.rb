class CreateBars < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.string :name
      t.string :address
      t.string :zipcode
      t.string :phone
      t.string :timing
      t.string :takesreservation
      t.string :parking
      t.string :goodforgroups
      t.string :ambience
      t.string :noiselevel
      t.string :goodfordancing
      t.string :alcohol
      t.string :happyhour
      t.string :smoking
      t.string :hastv

      t.timestamps null: false
    end
  end
end
