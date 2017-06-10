class CreateCommenttowns < ActiveRecord::Migration[5.0]
  def change
    create_table :commenttowns do |t|
      t.integer :state, null:false, default: 0
      t.text :content, null:false, limit:700, default: "Comenatario de la ciudad/pueblo"
      t.references :town, foreign_key: true
      t.references :user, foreign_key: true
      t.references :depart, foreign_key: true

      t.timestamps
    end
  end
end
