class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    create?
    # || user.admin? utile pour les utilisateurs admin.
  end

  def create?
    true
  end
end
