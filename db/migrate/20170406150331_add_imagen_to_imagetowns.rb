class AddImagenToImagetowns < ActiveRecord::Migration[5.0]
  def change
    add_column :imagetowns, :imagen, :string
  end
end
