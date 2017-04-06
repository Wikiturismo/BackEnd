class AddImagenToImagedeparts < ActiveRecord::Migration[5.0]
  def change
    add_column :imagedeparts, :imagen, :string
  end
end
