require 'kickstarter'

class SubscriberMailer < ActionMailer::Base
  default from: "pecunia-nunc@tusharsaxena.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.subscriber_mailer.daily_email.subject
  #
  def daily_email(subscriber, projs)
    @subscriber = subscriber
    @greeting = "Hi"
    @p = projs
    # binding.pry
    mail to: @subscriber.email, subject: "Hola Senor(ita)"
  end
end
