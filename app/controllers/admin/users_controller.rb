module Admin
  class UsersController < Admin::ApplicationController
    # Overwrite any of the RESTful controller actions to implement custom behavior
    # For example, you may want to send an email after a foo is updated.
    #
    # def update
    #   super
    #   send_foo_updated_email(requested_resource)
    # end

    # Override this method to specify custom lookup behavior.
    # This will be used to set the resource for the `show`, `edit`, and `update`
    # actions.
    #
    # def find_resource(param)
    #   Foo.find_by!(slug: param)
    # end

    # The result of this lookup will be available as `requested_resource`

    # Override this if you have certain roles that require a subset
    # this will be used to set the records shown on the `index` action.
    #
    # def scoped_resource
    #   if current_user.super_admin?
    #     resource_class
    #   else
    #     resource_class.with_less_stuff
    #   end
    # end

    # Override `resource_params` if you want to transform the submitted
    # data before it's persisted. For example, the following would turn all
    # empty values into nil values. It uses other APIs such as `resource_class`
    # and `dashboard`:
    #
    # def resource_params
    #   params.require(resource_class.model_name.param_key).
    #     permit(dashboard.permitted_attributes).
    #     transform_values { |value| value == "" ? nil : value }
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information

    def create
      user = User.new(resource_params)
      if user.save
        error = create_convertlabs_account(user) if params[:create_cl_account] == "true"
        raise StandardError, error if error

        error = create_nerdpilots_account(user) if params[:create_np_account] == "true"
        raise StandardError, error if error

        redirect_to admin_user_path(user), notice: translate_with_resource('create.success')
      else
        render :new, locals: { page: Administrate::Page::Form.new(dashboard, user),}
      end
    rescue => e
      Rollbar.error(e)
      redirect_to new_admin_user_path, alert: e.message
    end

    private

    def create_convertlabs_account(user)
      service = CLabsAccountService.new(user)
      service.execute(params[:user][:password])
      service.error
    end

    def create_nerdpilots_account(user)
      service = NPilots::AccountService.new(user)
      service.execute
      service.error
    end
  end
end
