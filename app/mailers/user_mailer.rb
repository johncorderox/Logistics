class UserMailer < ApplicationMailer
  default from: "logisticstruckdojo@gmail.com"
  def signup_confirmation(subscribe)
    @subscribe = subscribe
    mail to: @subscribe.email , subject: "Sign up confirmation"
  end
end
