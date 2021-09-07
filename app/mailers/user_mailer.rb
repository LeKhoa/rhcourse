class UserMailer < ApplicationMailer
  default from: "noreply@#{ENV['MAILGUN_DOMAIN']}"

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Rohan Academy')
  end
end
