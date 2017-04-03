class CreateDeparts < ActiveRecord::Migration[5.0]
  def change
    create_table :departs do |t|
      t.string :name, null:false, limit:45, default: "Nombre del departamento"
      t.string :capital, null:false, limit:45, default: "Nombre de la capital"
      t.string :demonym, null:false, limit:45, default: "Gentilicio"
      t.timestamps
    end
  end
end
