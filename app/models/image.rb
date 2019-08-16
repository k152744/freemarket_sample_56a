class Image < ApplicationRecord

  include ImageUploader[:image]  
  belongs_to :product
  validates :image_data, presence: true
end
