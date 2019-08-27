require 'rails_helper'

describe Point do
  describe '#create' do
    it "is invalid without a user_id" do
     point = Point.new(user_id: "")
     point.valid?
     expect(point.errors[:user_id]).to include("を入力してください")
    end
  end
end