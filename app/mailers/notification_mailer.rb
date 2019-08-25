class NotificationMailer < ApplicationMailer
  default from: 'no-replay@gmail.com'
 
  def contact_mail(user,text)
    @user = user
    @time = Time.zone.now
    @text = text
    mail(subject: "お問合せ受付完了のお知らせ" ,to: @user.email)
  end
end