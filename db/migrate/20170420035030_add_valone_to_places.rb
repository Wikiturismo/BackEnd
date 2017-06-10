class AddValoneToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :valone, :integer, null:false, default: 0
  end
end
