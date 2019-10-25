class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  # In some cases your controller might not have access to current_user,
  # or your current_user is not the method that should be invoked by Pundit
  def pundit_user
    User.first
  end

  def user_not_authorized
    render jsonapi: errors_response, status: :unathorized
  end

  def errors_response
    {
      errors:
      [
        { message: 'You are not authorized to perform this action.' }
      ]
    }
  end
end
