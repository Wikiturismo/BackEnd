class AddValfiveToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :valfive, :integer, null:false, default: 0
  end
end
