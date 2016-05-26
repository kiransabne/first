class AddWeekendhangoutToWeekends < ActiveRecord::Migration
  def change
    add_column :weekends, :weekendhangout, :string
  end
end
