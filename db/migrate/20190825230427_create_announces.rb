class CreateAnnounces < ActiveRecord::Migration[5.2]
  def change
    create_table :announces do |t|
      t.integer :active_user_id, null: false
      t.integer :favorite_id
      t.integer :comment_id
      t.integer :noticed
      t.references :product, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
