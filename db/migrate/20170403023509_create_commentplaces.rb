class CreateCommentplaces < ActiveRecord::Migration[5.0]
  def change
    create_table :commentplaces do |t|
      t.binary :state, null:false, default: false
      t.text :content, null:false, limit:700, default: "Comenatario del lugar"
      t.references :town, foreign_key: true
      t.references :place, foreign_key: true
      t.references :user, foreign_key: true
      t.references :depart, foreign_key: true

      t.timestamps
    end
  end
end
