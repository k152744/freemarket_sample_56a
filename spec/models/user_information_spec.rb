require 'rails_helper'
describe UserInformation do
  describe '#create' do
    it "is invalid without a family_name_kanji_shipping" do
      userInformation = build(:userInformation, family_name_kanji_shipping: nil)
      userInformation.valid?
      expect(userInformation.errors[:family_name_kanji_shipping]).to include("を入力してください")
    end
  end

  describe '#create' do
    it "is invalid without a first_name_kanji_shipping" do
      userInformation = build(:userInformation, first_name_kanji_shipping: nil)
      userInformation.valid?
      expect(userInformation.errors[:first_name_kanji_shipping]).to include("を入力してください")
    end
  end

  describe '#create' do
    it "is invalid without a family_name_kana_shipping" do
      userInformation = build(:userInformation, family_name_kana_shipping: nil)
      userInformation.valid?
      expect(userInformation.errors[:family_name_kana_shipping]).to include("を入力してください")
    end
  end

  describe '#create' do
    it "is invalid without a first_name_kana_shipping" do
      userInformation = build(:userInformation, first_name_kana_shipping: nil)
      userInformation.valid?
      expect(userInformation.errors[:first_name_kana_shipping]).to include("を入力してください")
    end
  end

  describe '#create' do
    it "is invalid without a post_number" do
      userInformation = build(:userInformation, post_number: nil)
      userInformation.valid?
      expect(userInformation.errors[:post_number]).to include("を入力してください")
    end
  end

  describe '#create' do
    it "is invalid without a village" do
      userInformation = build(:userInformation, village: nil)
      userInformation.valid?
      expect(userInformation.errors[:village]).to include("を入力してください")
    end
  end

  describe '#create' do
    it "is invalid without a address" do
      userInformation = build(:userInformation, address: nil)
      userInformation.valid?
      expect(userInformation.errors[:address]).to include("を入力してください")
    end
  end

  describe '#create' do
    it "is invalid without a user_id" do
      userInformation = build(:userInformation, user_id: nil)
      userInformation.valid?
      expect(userInformation.errors[:user_id]).to include("を入力してください")
    end
  end

  describe '#create' do
    it "is invalid without a shipping_origin_id" do
      userInformation = build(:userInformation, shipping_origin_id: nil)
      userInformation.valid?
      expect(userInformation.errors[:shipping_origin_id]).to include("を入力してください")
    end
  end

end