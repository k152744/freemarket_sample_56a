class CreateSmallCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :small_categories do |t|
      t.string :name,null: false
      t.references :middle_category,foreign_key: true
      t.timestamps
    end
  end
end
