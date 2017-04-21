class AddImageToImagePlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :imageplaces, :image, :string
  end
end
