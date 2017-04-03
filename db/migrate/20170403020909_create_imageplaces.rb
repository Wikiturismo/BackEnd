class CreateImageplaces < ActiveRecord::Migration[5.0]
  def change
    create_table :imageplaces do |t|
      t.integer :height
      t.integer :width
      t.string :path
      t.references :place, foreign_key: true

      t.timestamps
    end
  end
end
