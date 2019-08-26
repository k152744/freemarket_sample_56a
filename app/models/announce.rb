class Announce < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :comment_id, presence: true, unless: :favorite_id?
end
