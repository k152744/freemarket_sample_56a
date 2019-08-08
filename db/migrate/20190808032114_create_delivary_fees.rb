class CreateDelivaryFees < ActiveRecord::Migration[5.2]
  def change
    create_table :delivary_fees do |t|
      t.string :name,null: false
      t.timestamps
    end
  end
end
