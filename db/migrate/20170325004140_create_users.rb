class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, null:false, limit:50, default: "Nombre de usuario"
      t.string :kind, null:false, limit:20, default: "Tipo"
      t.string :mail, null:false, limit:60, default: "Correo electronico"
      t.string :ubication, default: "Ubicacion"
      t.date :registdate, null:false

      t.timestamps
    end
  end
end
