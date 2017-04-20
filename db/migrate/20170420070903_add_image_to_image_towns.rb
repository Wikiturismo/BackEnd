class AddImageToImageTowns < ActiveRecord::Migration[5.0]
  def change
    add_column :imagetowns, :image, :string
  end
end
