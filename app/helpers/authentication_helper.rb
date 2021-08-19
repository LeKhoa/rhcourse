module AuthenticationHelper
  
  def authenticate
    render json: unauthorized_error, status: :unauthorized unless valid?(params[:secret_key])
  end

  private

  def valid?(key)
    ENV['CLABS_API_SECRET_KEY'] && key == ENV['CLABS_API_SECRET_KEY']
  end

  def unauthorized_error
    {
      error: 'You are not authorized to access this resource, verify that you are passing a correct secret key',
    }
  end
end
