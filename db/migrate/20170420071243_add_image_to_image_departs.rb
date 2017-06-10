class AddImageToImageDeparts < ActiveRecord::Migration[5.0]
    def change
      add_column :imagedeparts, :image, :string
    end
end
