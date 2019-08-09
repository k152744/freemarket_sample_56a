class Product < ApplicationRecord
  belongs_to :user
  belongs_to :shipping_origin
  belongs_to :big_category
  belongs_to :middle_category
  belongs_to :small_category
  belongs_to :brand
  belongs_to :status
  belongs_to :delivary_fee
  belongs_to :delivary_way
  belongs_to :delivary_day

  validates :name, presence: true
  validates :detail, presence: true
  validates :price, presence: true
  validates :listing_status, presence: true
end
