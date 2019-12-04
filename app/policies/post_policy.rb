class PostPolicy < ApplicationPolicy
  def permitted_attributes
    if user.admin? || user.national?
      [:title, :body, :framework]
    else
      [:body]
    end
  end
end
