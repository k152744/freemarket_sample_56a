class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string ,null: false
    add_column :users, :family_name_kanji, :string ,null: false
    add_column :users, :first_name_kanji, :string ,null: false
    add_column :users, :family_name_kana, :string ,null: false
    add_column :users, :first_name_kana, :string ,null: false
    add_column :users, :birthday, :date ,null: false
  end
end
