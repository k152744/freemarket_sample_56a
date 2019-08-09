class SmallCategory < ApplicationRecord
  has_many :products
  belongs_to :middle_category
end
