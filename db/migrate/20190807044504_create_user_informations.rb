class CreateUserInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :user_informations do |t|
      t.string :family_name_kanji_shipping ,null: false
      t.string :first_name_kanji_shipping, null: false
      t.string :family_name_kana_shipping, null: false
      t.string :first_name_kana_shipping, null: false
      t.integer :post_number,null: false
      t.string :village,null: false
      t.string :address,null: false
      t.string :building_name
      t.bigint :phone_number
      t.references :user,foreign_key: true
      t.timestamps
    end
  end
end
