class AddColumnUserInformations < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_informations, :shipping_origin, foreign_key: true
  end
end
