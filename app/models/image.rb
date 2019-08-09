class Image < ApplicationRecord
  include ImageUploader[:image]  

  belongs_to :product
end
