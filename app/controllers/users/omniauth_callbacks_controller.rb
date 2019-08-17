class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_from :facebook
  end
  def google_oauth2
    callback_from :google_oauth2
  end
  private

  def callback_from(provider)

    provider = provider.to_s
    @user = User.find_for_oauth(request.env['omniauth.auth'])
    if @user.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.sns_data"]={}
      session["devise.sns_data"]["name"] = request.env['omniauth.auth']["info"]["name"]
      session["devise.sns_data"]["email"] = request.env['omniauth.auth']["info"]["email"] 
      session["devise.sns_data"]["uid"] = request.env['omniauth.auth']["uid"]
      session["devise.sns_data"]["provider"] = request.env['omniauth.auth']["provider"]
      session["devise.sns_data"]['valid'] = true
      redirect_to new_user_registration_url
    end
  end

end