class Api::UsersController < ApplicationController

  def update
    if current_user.update(user_params)
      render json: { user: current_user }, methods: attach_methods, status: :ok
    else
      render json: { message: current_user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def change_password
    if current_user.update_with_password(password_params)
      bypass_sign_in current_user
      render json: { user: current_user }, methods: attach_methods, status: :ok
    else
      render json: { message: current_user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def set_password
    if current_user.reset_password(password_params[:password], password_params[:password_confirmation])
      bypass_sign_in current_user
      render json: { user: current_user }, methods: attach_methods, status: :ok
    else
      render json: { message: current_user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def retrieve_card
    service = SubscriptionService.new(current_user, params[:token])
    card = service.retrieve_card
    return render json: { message: service.error }, status: :unprocessable_entity \
      unless service.success?
    render json: { card: card }, status: :ok
  end

  def update_card
    service = SubscriptionService.new(current_user, params[:token])
    service.update_card
    return render json: { message: service.error }, status: :unprocessable_entity \
      unless service.success?

    retrieve_card
  end

  def resubcribe
    service = SubscriptionService.new(current_user, params[:token])
    service.update_card
    return render json: { message: service.error }, status: :unprocessable_entity \
      unless service.success?

    service.subscribe(current_user.courses.first)
    return render json: { message:  service.error }, status: :unprocessable_entity unless service.success?

    retrieve_card
  end

  private

  def attach_methods
    [:image_url, :has_password, :sub_status]
  end

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
