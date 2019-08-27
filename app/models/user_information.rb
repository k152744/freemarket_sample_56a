class UserInformation < ApplicationRecord
  # belongs_to :user
  belongs_to :shipping_origin

  validates :family_name_kanji_shipping, presence: true
  validates :first_name_kanji_shipping, presence: true
  validates :family_name_kana_shipping, presence: true
  validates :first_name_kana_shipping, presence: true
  validates :post_number, presence: true
  validates :village, presence: true
  validates :address, presence: true
  validates :user_id, presence: true
  validates :shipping_origin_id, presence: true
end
