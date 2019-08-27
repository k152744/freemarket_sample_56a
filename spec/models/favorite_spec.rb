require 'rails_helper'

describe Favorite do
  describe '#create' do
    it "is invalid without a image_data" do
     favorite = Favorite.new(user_id: "")
     favorite.valid?
     expect(favorite.errors[:user_id]).to include("を入力してください")
    end
  end

  describe '#create' do
    it "is invalid without a image_data" do
     favorite = Favorite.new(product_id: "")
     favorite.valid?
     expect(favorite.errors[:product_id]).to include("を入力してください")
    end
  end
end