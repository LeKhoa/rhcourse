# frozen_string_literal: true

class CLabsAccountService < BaseService
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def execute
    return if user.cl_account_created?

    user.cl_email ||= user.email
    user.cl_password ||= Devise.friendly_token(10)
    user.save!

    user_data = {
      name: user.name,
      email: user.cl_email,
      phone: user.phone,
      password: user.cl_password
    }

    data = CipherService.encrypt(PHP.serialize(user_data))

    options = {
      body: {
        data: data,
        theme: '1'
      }
    }

    response = HTTParty.post('https://convertlabs.io/api/ota/user_bundle_setup', options)

    if response.code == 200 && response['success'] == 'success'
      user.update_column(:cl_account_created, true)
    else
      Rollbar.error('Could not create ConvertLabs account', user_id: user.id,
        response: response)
      error!(response)
    end
  rescue StandardError => e
    Rollbar.error(e, user_id: user&.id)
    error!(e.message)
  end
end
