module Api
  module NPilots
    class TasksController < ApplicationController

      def create
        service = ::NPilots::ApiService.new(current_user)
        response = service.get_support

        if service.success?
          render json: { 
            status: 'success', 
            message: "Create NerdPilots Task[#{response['project_id']}] successfully" 
          }, status: :ok
        else
          render json: { status: 'error', message: service.error }, status: :internal_server_error
        end
      end
    end
  end
end