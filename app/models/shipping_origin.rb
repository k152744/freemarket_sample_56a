class ShippingOrigin < ApplicationRecord
  has_many :products
  has_many :user_informations
end
