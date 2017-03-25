class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.binary :state
      t.text :content
      t.datetime :publicationdate
      t.references :town, foreign_key: true
      t.references :place, foreign_key: true
      t.references :user, foreign_key: true
      t.references :depart, foreign_key: true

      t.timestamps
    end
  end
end