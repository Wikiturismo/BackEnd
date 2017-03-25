class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.integer :height
      t.integer :width
      t.references{polymorphic :imageable
      t.string :true}

      t.timestamps
    end
  end
end
