class UserSignUpsController < ApplicationController
  skip_before_action :authenticate_user!

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
      redirect_to card_user_sign_ups_url
    elsif  path[:controller] == "user_sign_ups" && path[:action] == "card"
      redirect_to user_sign_ups_url
    end
  end
end

