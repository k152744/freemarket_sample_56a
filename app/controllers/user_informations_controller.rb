class UserInformationsController < ApplicationController
  before_action :header_big_category
  before_action :header_brand

  def listing
    @products = Product.includes(:user).where(listing_status: "出品中")
  end
end
