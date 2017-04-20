class AddValthreeToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :valthree, :integer, null:false, default: 0
  end
end
