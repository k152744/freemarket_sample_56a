class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_one :announce,dependent: :destroy
end
