class OfferPolicy < ApplicationPolicy
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

    def edit?
      true
    end

    def update?
      edit?
    end


  def show?
    true
  end

  def destroy?
    record.user == user
  end

end
