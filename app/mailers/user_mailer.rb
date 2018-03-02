class UserMailer < ApplicationMailer
  default from: "eunjkim1221@yahoo.com"
  def signup_confirmation(subscribe)
    @subscribe = subscribe
    mail to: @subscribe.email , subject: "Sign up confirmation"
  end
end
