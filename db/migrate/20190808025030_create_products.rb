class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name ,null: false
      t.string :detail, null: false
      t.integer :price,null: false
      t.string :listing_status, null: false
      t.integer :buyer_id
      t.references :user,foreign_key: true
      t.timestamps
    end
  end
end
