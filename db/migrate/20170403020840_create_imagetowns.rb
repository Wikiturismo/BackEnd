class CreateImagetowns < ActiveRecord::Migration[5.0]
  def change
    create_table :imagetowns do |t|
      t.integer :height
      t.integer :width
      t.string :path
      t.references :town, foreign_key: true

      t.timestamps
    end
  end
end
