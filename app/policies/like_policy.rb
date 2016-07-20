class LikePolicy < ApplicationPolicy
  def destroy?
    user.present?
  end
end
