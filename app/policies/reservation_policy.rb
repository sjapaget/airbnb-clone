class ReservationPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user: user)
    end
  end

  def new?
    create?
  end

  def create?
    true
  end

  def destroy?
    record.id = user
  end
end
