# frozen_string_literal: true

class UserNotifierService < BaseService
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def send_welcome_email
    UserMailer.welcome(user).deliver_now
  rescue StandardError => e
    Rollbar.error(e)
    error!(e.message)
  end
end
