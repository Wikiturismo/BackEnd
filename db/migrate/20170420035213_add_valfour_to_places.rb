class AddValfourToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :valfour, :integer, null:false, default: 0
  end
end
