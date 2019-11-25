class PostPolicy < ApplicationPolicy
  def permitted_attributes
    if user.admin? || user.national?
      [:title, :body]
    else
      [:body]
    end
  end
end
