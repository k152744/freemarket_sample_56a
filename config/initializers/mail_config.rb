ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com',
  domain: 'gmail.com',
  port: 587,
  user_name: "#{Rails.application.credentials.contact[:mail]}",
  password: "#{Rails.application.credentials.contact[:pass]}",
  authentication: 'plain',
  enable_starttls_auto: true
}