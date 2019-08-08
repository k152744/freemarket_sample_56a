class CreateDelivaryWays < ActiveRecord::Migration[5.2]
  def change
    create_table :delivary_ways do |t|
      t.string :name,null: false
      t.timestamps
    end
  end
end
