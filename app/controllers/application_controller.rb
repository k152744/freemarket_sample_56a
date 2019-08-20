class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  private

  def header_big_category
    @big_categories = BigCategory.all
  end
  def header_brand
    @brands = Brand.all
  end
  
  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource_or_scope)
    tell_user_sign_ups_path

  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:family_name_kanji,:first_name_kanji,:family_name_kana,:first_name_kana,:birthday])
  end
end
