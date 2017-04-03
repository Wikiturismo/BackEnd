class CreateImagedeparts < ActiveRecord::Migration[5.0]
  def change
    create_table :imagedeparts do |t|
      t.integer :height
      t.integer :width
      t.string :path
      t.references :depart, foreign_key: true

      t.timestamps
    end
  end
end
