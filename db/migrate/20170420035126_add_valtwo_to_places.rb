class AddValtwoToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :valtwo, :integer, null:false, default: 0
  end
end
