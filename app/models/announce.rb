class Announce < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :favorite
  belongs_to :comment
  validates :comment_id, presence: true, unless: :favorite_id?
end
