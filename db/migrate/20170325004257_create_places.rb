class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :name
      t.binary :state
      t.datetime :publicationdate
      t.text :description
      t.string :ubication
      t.string :address
      t.string :type
      t.integer :valoration
      t.integer :entrycost
      t.references :town, foreign_key: true
      t.references :depart, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
