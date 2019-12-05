class PostPolicy < ApplicationPolicy
  def permitted_attributes
    if user.admin? || user.national?
      [:title, :body, :framework_id, :user_id]
    else
      [:body]
    end
  end

  def create?
    user.admin?
  end
end
