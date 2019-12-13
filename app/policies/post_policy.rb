class PostPolicy < ApplicationPolicy
  def permitted_attributes
    if user.admin? || user.national?
      [:title, :body, :framework_id, :user_id]
    else
      [:body]
    end
  end

  def update?
    user.admin? || user.national? || user.local?
  end

  def create?
    user.admin?
  end
end
