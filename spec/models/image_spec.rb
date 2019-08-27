require 'rails_helper'

describe Image do
  describe '#create' do
    it "is invalid without a image_data" do
     image = Image.new(image_data: "")
     image.valid?
     expect(image.errors[:image_data]).to include("を入力してください")
    end
  end
end