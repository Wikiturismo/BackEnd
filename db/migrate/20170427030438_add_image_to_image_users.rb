class AddImageToImageUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :imageusers, :image, :string
  end
end
