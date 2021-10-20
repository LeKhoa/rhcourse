# frozen_string_literal: true

class CLabsAccountService < BaseService
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def execute(password)
    return if user.cl_account_created?

    user_data = {
      name: user.name,
      email: user.email,
      phone: user.phone,
      password: password
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
      user.update!(cl_account_created: true, cl_email: user.email, cl_password: password)
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
