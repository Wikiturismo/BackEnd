class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :name, null:false, limit:60, default: "Nombre del lugar"
      t.boolean :state, null:false, default: false
      t.datetime :publicationdate, null:false
      t.text :description, null:false, default: "Descripcion"
      t.string :ubication, null:false, limit:80, default: "Ubicacion"
      t.string :address, null:false, limit:50, default: "Direccion"
      t.string :kind, null:false, limit:45, default: "Tipo"
      t.float :valoration, default: 0
      t.integer :entrycost, default: 0
      t.references :town, foreign_key: true
      t.references :depart, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
