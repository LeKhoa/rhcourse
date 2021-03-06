# frozen_string_literal: true

module NPilots
  class AccountService < BaseService
    USER_BUNDLE_SETUP_ENDPOINT = 'https://app.nerdpilots.com/api/ra/user_bundle_setup'

    attr_reader :user

    def initialize(user)
      @user = user
    end

    def execute(password)
      return if user.np_account_created?

      user_data = {
        name: user.name,
        email: user.email,
        phone: user.phone,
        password: password,
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
  end
end
