# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  def welcome
    UserMailer.welcome(User.new(name: 'test', email: 'test@test.com', cl_password: '1234567890'))
  end
end
