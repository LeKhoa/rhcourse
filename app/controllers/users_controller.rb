class UsersController < ApplicationController
  def update
    if current_user.update(user_params)
      render json: { user: current_user }, methods: [:image_url], status: :ok 
    else
      render json: { message: current_user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def change_password
    if current_user.update_with_password(password_params)
      render json: { user: current_user }, status: :ok 
    else
      render json: { message: current_user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :phone,
      :image,
    )
  end

  def password_params
    params.require(:user).permit(
      :current_password,
      :password,
      :password_confirmation,
    )
  end
end
