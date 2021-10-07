# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def old_create
    resource = User.where(email: sign_up_params[:email]).first
    if resource
      return respond_failure('This email already has subscriptions, please visit login link to login Rohan Academy') \
        if resource.subscriptions.present?
      sign_up(resource_name, resource)
      return respond_success(resource, 'Email is already in use', after_sign_up_path_for(resource))
    end
    resource = build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_success(resource, 'Signed up successfully', after_sign_up_path_for(resource))
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_success(resource, "Signed up successfully, #{resource.inactive_message}")
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_failure(resource.errors.full_messages)
    end
  end

  def create
    resource = build_resource(sign_up_params)
    error = nil

    User.transaction do
      resource.save
      return respond_failure(resource.errors.full_messages) if resource.errors.full_messages.present?

      error = execute_subservices(resource, params[:token])
      raise ActiveRecord::Rollback if error.present?
    end

    return respond_failure(error) if error.present?

    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_success(resource, 'Signed up successfully', after_sign_up_path_for(resource))
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_success(resource, "Signed up successfully, #{resource.inactive_message}")
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_failure(resource.errors.full_messages)
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    error = execute_registration_subservices(resource, params[:token])
    return respond_failure(error) if error.present?

    resource_updated = update_resource_without_password(resource, account_update_params)
    yield resource if block_given?
    if resource_updated
      set_flash_message_for_update(resource, prev_unconfirmed_email)
      bypass_sign_in resource
      respond_success(resource, 'Subscribe successfully', after_update_path_for(resource))
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_failure(resource.errors.full_messages)
    end
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :phone, :budget_type, :password, :password_confirmation])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [
      :name, :email, :phone, :budget_type, :password, :password_confirmation, :current_password,
      :business_status, challenges: [], concerns: [], criterias: [],
    ])
  end

  def update_resource_without_password(resource, params)
    resource.update_without_password(params)
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  def respond_success(user, message, path)
    respond_to do |format|
      format.html { redirect_to path, notice: message }
      format.json { render json: { user: user }, status: :ok  }
    end
  end

  def respond_failure(error)
    respond_to do |format|
      format.html { render :new }
      format.json { render json: { message: error }, status: :unprocessable_entity }
    end
  end

  def execute_subservices(resource, token)
    service = SubscriptionService.new(resource, token)
    service.subscribe(resource.courses.first)
    return service.error unless service.success?

    service = CLabsAccountService.new(resource)
    service.execute(sign_up_params[:password])
    return service.error unless service.success?

    service = NPilots::AccountService.new(resource)
    service.execute
    return service.error unless service.success?

    if Rails.env.production?
      service = UserNotifierService.new(resource)
      service.send_welcome_email
      return service.error unless service.success?
    end
    nil
  end
end
