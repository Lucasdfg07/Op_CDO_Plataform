class ApplicationMailer < ActionMailer::Base
  default from: ENV['DEVISE_EMAIL']
  layout "mailer"
end
