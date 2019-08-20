class UserSignUpsController < ApplicationController
  skip_before_action :authenticate_user!
  require "payjp"
  
  def tell
    path = Rails.application.routes.recognize_path(request.referer)
    if path[:controller] != "users/registrations" && path[:controller] != "users"
      redirect_to root_url
    end
  end

  def auth_tell
    path = Rails.application.routes.recognize_path(request.referer)
    if path[:controller] != "user_sign_ups" && path[:action] != "tell"
      redirect_to root_url
    end
  end

  def shipping

    @user_info = UserInformation.new(family_name_kanji_shipping:current_user.family_name_kanji,first_name_kanji_shipping:current_user.first_name_kanji,family_name_kana_shipping:current_user.family_name_kana,first_name_kana_shipping:current_user.first_name_kana)
    path = Rails.application.routes.recognize_path(request.referer)
    if path[:controller] != "user_sign_ups" && path[:action] != "auth_tell"
      redirect_to root_url
    end
    @shipping_origin = ShippingOrigin.all
  end

  def card
    path = Rails.application.routes.recognize_path(request.referer)
    if path[:controller] != "user_sign_ups" && path[:action] != "shipping"
      redirect_to root_url
    end
    @card = Card.new
  end

  def show
    path = Rails.application.routes.recognize_path(request.referer)
    if path[:controller] != "user_sign_ups" && path[:action] != "card"
      redirect_to root_url
    end
  end

  def post_controll
    path = Rails.application.routes.recognize_path(request.referer)
    if path[:controller] == "user_sign_ups" && path[:action] == "tell"
      redirect_to auth_tell_user_sign_ups_url
    elsif  path[:controller] == "user_sign_ups" && path[:action] == "auth_tell"
      redirect_to shipping_user_sign_ups_url
    elsif  path[:controller] == "user_sign_ups" && path[:action] == "shipping"
      user_info = UserInformation.new(user_info_prams)
      if user_info.save
        redirect_to card_user_sign_ups_url
      else
        redirect_to shipping_user_sign_ups_url       
      end
    elsif  path[:controller] == "user_sign_ups" && path[:action] == "card"
      binding.pry
      Payjp.api_key = Rails.application.credentials.PAYJP_SECRET_KEY
      customer = Payjp::Customer.create(
        description: 'test-card',
        email: current_user.email,
        card: params['payjp-token'],
        metadata: {user_id: current_user.id, user_name: current_user.nickname}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to user_sign_ups_url
      else
        redirect_to card_user_sign_ups_url
      end
    end
  end

  private
  def user_info_prams
    params.require(:user_information).permit(:family_name_kanji_shipping,:first_name_kanji_shipping,:family_name_kana_shipping,:first_name_kana_shipping,:post_number,:shipping_origin_id,:village,:address,:building_name,:phone_number).merge(user_id:current_user.id)
  end
end

