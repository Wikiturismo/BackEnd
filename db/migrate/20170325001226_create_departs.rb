class CreateDeparts < ActiveRecord::Migration[5.0]
  def change
    create_table :departs do |t|
      t.string :name
      t.string :capital
      t.string :demonym

      t.timestamps
    end
  end
end
