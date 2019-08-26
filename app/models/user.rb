class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  # has_one :user_information
  validates :nickname, presence: true
  validates :family_name_kanji, presence: true
  validates :first_name_kanji, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birthday, presence: true
  has_many :products
  has_many :cards
  has_many :fav_products, through: :favorites, source: :products, dependent: :destroy
  has_many :comments
  has_many :user
  has_many :announces,dependent: :destroy
  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.new(
        uid:      auth.uid,
        provider: auth.provider,
        email:    auth.info.email,
        nickname: auth.info.name,
      )
    end

    user
  end
end
