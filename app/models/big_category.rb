class BigCategory < ApplicationRecord
  has_many :middle_categories
  has_many :products

end
