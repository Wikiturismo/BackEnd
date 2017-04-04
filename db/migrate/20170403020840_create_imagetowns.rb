class CreateImagetowns < ActiveRecord::Migration[5.0]
  def change
    create_table :imagetowns do |t|
      t.integer :height, null:false, default: 500
      t.integer :width, null:false, default: 500
      t.string :path, null:false, limit:100, default: "Direccion"
      t.references :town, foreign_key: true

      t.timestamps
    end
  end
end
