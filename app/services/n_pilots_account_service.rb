# frozen_string_literal: true

class NPilotsAccountService < BaseService
  USER_BUNDLE_SETUP_ENDPOINT = 'https://app.nerdpilots.com/api/ra/user_bundle_setup'

  attr_reader :user

  def initialize(user)
    @user = user
  end

  def execute
    return if user.np_account_created?
    if user.reload.subscriptions.blank?
      raise ArgumentError, "User #{user.email} has no active subscriptions."
    end

    user_data = {
      name: user.name,
      email: user.email,
      phone: user.phone,
      password: user.cl_password
    }

    data = CipherService.encrypt(PHP.serialize(user_data))

    options = {
      body: {
        data: data,
        theme: '1',
      }
    }
    response = HTTParty.post(USER_BUNDLE_SETUP_ENDPOINT, options)
    return response_error!(response) if !response_success?(response)

    user.update_column(:np_account_created, true)
  rescue StandardError => e
    execute_error!(e)
  end

  protected

  def response_success?(response)
    response.code == 200 && response['status'] == 'success'
  end

  def response_error!(response)
    Rollbar.error('Could not create NerdPilots account', user_id: user.id, response: response)
    error!(response.to_s)
  end

  def execute_error!(e)
    Rollbar.error(e, user_id: user&.id)
    error!(e.message)
  end
end
