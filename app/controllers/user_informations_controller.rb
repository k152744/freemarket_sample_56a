class UserInformationsController < ApplicationController
  before_action :header_big_category
  before_action :header_brand

  def listing
    @products = Product.includes(:user).where(listing_status: "出品中")
  end
  def shipping_edit
    @user_info = UserInformation.where("user_id = ?",params[:id])
    if @user_info.present?
      @user_info = @user_info[0]
    else
      @user_info = UserInformation.new(family_name_kanji_shipping:current_user.family_name_kanji,first_name_kanji_shipping:current_user.first_name_kanji,family_name_kana_shipping:current_user.family_name_kana,first_name_kana_shipping:current_user.first_name_kana)
    end

    @shipping_origin = ShippingOrigin.all
  end

  def shipping_change
    @user_info = UserInformation.where("user_id = ?",params[:id])
    if @user_info.present?
      @user_info = @user_info[0]
      @user_info.update(user_info_prams)
    else
      @user_info = UserInformation.create(user_info_prams)
    end
    redirect_to shipping_edit_user_information_url
  end
  private
  def user_info_prams
    params.require(:user_information).permit(:family_name_kanji_shipping,:first_name_kanji_shipping,:family_name_kana_shipping,:first_name_kana_shipping,:post_number,:shipping_origin_id,:village,:address,:building_name,:phone_number).merge(user_id:current_user.id)
  end
end
