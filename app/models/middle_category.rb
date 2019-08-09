class MiddleCategory < ApplicationRecord
  has_many :products
  has_many :small_categories
  belongs_to :big_category
end
