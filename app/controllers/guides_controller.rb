class GuidesController < ApplicationController
  before_action :header_big_category, only: [:show,:new,:complete]
  before_action :header_brand, only: [:show,:new,:complete]
  require 'json'
  require 'net/https'
  require "uri"
  

  def create
    NotificationMailer.contact_mail(current_user,params[:contact]).deliver_now
    redirect_to complete_guides_path
  end

  def complete
  end

  def bot
    data = {
      "message": params[:keyword],
      "key": "#{Rails.application.credentials.bot[:key]}"
    }

    query=data.to_query
    uri = URI("https://chatbot-api.userlocal.jp/api/chat?"+query)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    req = Net::HTTP::Get.new(uri)
    res = http.request(req)
    @res_data=JSON.parse(res.body)
  end
end
