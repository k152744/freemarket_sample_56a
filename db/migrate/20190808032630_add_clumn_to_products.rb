class AddClumnToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :brand, foreign_key: true
    add_reference :products, :big_category, foreign_key: true
    add_reference :products, :middle_category, foreign_key: true
    add_reference :products, :small_category, foreign_key: true
    add_reference :products, :status, foreign_key: true
    add_reference :products, :delivary_fee, foreign_key: true
    add_reference :products, :delivary_way, foreign_key: true
    add_reference :products, :delivary_day, foreign_key: true
    add_reference :products, :shipping_origin, foreign_key: true
  end
end
