class CreateTowns < ActiveRecord::Migration[5.0]
  def change
    create_table :towns do |t|
      t.string :name, null:false, limit:45, default: "Ciudad/Pueblo"
      t.string :weather, limit:45, default: "Clima"
      t.float :avertemper, default: 0
      t.integer :altitude, default: 0
      t.string :demonym, limit:45, default: "Gentilicio"
      t.boolean :airport, null:false, default: true
      t.boolean :transpterminal, null:false, default: true
      t.references :depart, foreign_key: true
      t.timestamps
    end
  end
end
