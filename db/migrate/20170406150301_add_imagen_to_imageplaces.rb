class AddImagenToImageplaces < ActiveRecord::Migration[5.0]
  def change
    add_column :imageplaces, :imagen, :string
  end
end
