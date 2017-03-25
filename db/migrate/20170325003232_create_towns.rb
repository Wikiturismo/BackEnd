class CreateTowns < ActiveRecord::Migration[5.0]
  def change
    create_table :towns do |t|
      t.string :name
      t.string :weather
      t.float :avertemper
      t.integer :altitude
      t.string :demonym
      t.binary :airport
      t.binary :transpterminal
      t.references :depart, foreign_key: true
      t.timestamps
    end
  end
end
