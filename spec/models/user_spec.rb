require 'rails_helper'
describe User do
  describe '#create' do
    it "is invalid without a nickname" do
     user = build(:user, nickname: nil)
     user.valid?
     expect(user.errors[:nickname]).to include("を入力してください")
    end
  end

  describe '#create' do
    it "is invalid without a email" do
     user = build(:user, email: nil)
     user.valid?
     expect(user.errors[:email]).to include("を入力してください")
    end
  end

  describe '#create' do
    it "is invalid without a family_name_kanji" do
     user = build(:user, family_name_kanji: nil)
     user.valid?
     expect(user.errors[:family_name_kanji]).to include("を入力してください")
    end
  end

  describe '#create' do
    it "is invalid without a family_name_kana:" do
     user = build(:user, family_name_kana: nil)
     user.valid?
     expect(user.errors[:family_name_kana]).to include("を入力してください")
    end
  end

  describe '#create' do
    it "is invalid without a first_name_kanji" do
     user = build(:user, first_name_kanji: nil)
     user.valid?
     expect(user.errors[:first_name_kanji]).to include("を入力してください")
    end
  end

  describe '#create' do
    it "is invalid without a first_name_kana" do
     user = build(:user, first_name_kana: nil)
     user.valid?
     expect(user.errors[:first_name_kana]).to include("を入力してください")
    end
  end

  describe '#create' do
    it "is invalid without a birthday" do
     user = build(:user, birthday: nil)
     user.valid?
     expect(user.errors[:birthday]).to include("を入力してください")
    end
  end

end