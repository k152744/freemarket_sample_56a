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
  has_many :images, dependent: :destroy
  has_many :users, through: :favorites,dependent: :destroy
  has_many :favorites
  validates :name, presence: true
  validates :detail, presence: true
  validates :price, presence: true
  validates :listing_status, presence: true
  validates :user_id, presence: true
  validates :brand_id, presence: true
  validates :big_category_id, presence: true
  validates :middle_category_id, presence: true
  validates :small_category_id, presence: true
  validates :status_id, presence: true
  validates :delivary_fee_id, presence: true
  validates :delivary_way_id, presence: true
  validates :delivary_day_id, presence: true
  validates :shipping_origin_id, presence: true
end
