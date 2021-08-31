module Api
  module CLabs
    class AccountsController < ApplicationController
      include AuthorizationHelper
      before_action :authorize, only: [:verify]

      # GET /api/c_labs/verify?email=email&secret_key=secret
      def verify
        user = User.find_by_email(params[:email])
        return render json: { status: 'none', active: false, }, status: :ok if user.nil?

        if user.active_subscriptions.first.present?
          render json: { status: 'success', active: true }, status: :ok
        else
          render json: { status: 'success', active: false }, status: :ok
        end
      rescue
        render json: { status: 'error', active: false }, status: :ok
      end
    end
  end
end
