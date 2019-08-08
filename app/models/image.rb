class Image < ApplicationRecord
  include ImageUploader[:image]  
end
