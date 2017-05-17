class CreateValorations < ActiveRecord::Migration[5.0]
  def change
    create_table :valorations do |t|
      t.integer :val
      t.references :place, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
