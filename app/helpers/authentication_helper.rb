module AuthenticationHelper
  
  def authenticate
    render json: unauthorized_error, status: :unauthorized if params[:secret_key] != ENV['CLABS_API_SECRET_KEY']
  end

  private

  def unauthorized_error
    {
      error: 'You are not authorized to access this resource, verify that you are passing a correct secret key',
    }
  end
end