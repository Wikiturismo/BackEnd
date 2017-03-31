class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :kind
      t.string :mail
      t.string :ubication
      t.date :registdate

      t.timestamps
    end
  end
end
