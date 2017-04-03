class CreateCommentplaces < ActiveRecord::Migration[5.0]
  def change
    create_table :commentplaces do |t|
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
