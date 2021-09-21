# frozen_string_literal: true

module NPilots
  class ApiService < BaseService

    BASE_URL = 'https://app.nerdpilots.com/api/ra/'
    ENDPONTS = {
      get_suport: 'get_support',
    }

    attr_reader :user

    def initialize(user)
      @user = user
    end

    def get_support
      query = {
        name: user.name,
        email: user.email,
      }
      response = HTTParty.post("#{BASE_URL}#{ENDPONTS[:get_suport]}", query: query)
      return response_error!(response) if !response_success?(response)
      response
    rescue => e
      execute_error!(e)
    end

    protected

    def response_success?(response)
      response.code == 200 && response['status'] == 'success'
    end
  end
end
