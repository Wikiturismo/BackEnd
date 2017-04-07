class CreateImgtowns < ActiveRecord::Migration[5.0]
  def change
    create_table :imgtowns do |t|
      t.string :name
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
