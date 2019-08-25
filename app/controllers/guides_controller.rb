class GuidesController < ApplicationController
  before_action :header_big_category, only: [:show,:new,:complete]
  before_action :header_brand, only: [:show,:new,:complete]


  def create
    NotificationMailer.contact_mail(current_user,params[:contact]).deliver_now
    redirect_to complete_guides_path
  end
  def complete
  end
end
