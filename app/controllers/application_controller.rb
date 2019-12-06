class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include Pundit

  rescue_from Pundit::NotAuthorizedError, ActionController::UnpermittedParameters, with: :user_not_authorized

  private

  # In some cases your controller might not have access to current_user,
  # or your current_user is not the method that should be invoked by Pundit
  # You can a user with another role, see the provided below methods:
  # admin_user, natioal_usr or local_user
  def pundit_user
    local_user
  end

  def user_not_authorized
    render jsonapi: errors_response, status: :unauthorized
  end

  def errors_response
    {
      errors:
        [
          { message: 'You are not authorized to perform this action.' }
        ],
      title: 'Invalid Attribute'
    }
  end

  def admin_user
    User.admin.first
  end

  def national_user
    User.national.first
  end

  def local_user
    User.local.first
  end
end
