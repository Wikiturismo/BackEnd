class CreateImagedeparts < ActiveRecord::Migration[5.0]
  def change
    create_table :imagedeparts do |t|
      t.integer :height, null:false, default: 500
      t.integer :width, null:false, default: 500
      t.string :path, null:false, limit:100, default: "Direccion"
      t.references :depart, foreign_key: true

      t.timestamps
    end
  end
end
