class CreatePubs < ActiveRecord::Migration
  def change
    create_table :pubs do |t|
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
      t.string :alcoho
      t.string :happyhour
      t.string :smoking
      t.string :hastv
      t.string :bar

      t.timestamps null: false
    end
  end
end
