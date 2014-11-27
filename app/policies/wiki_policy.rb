class WikiPolicy < ApplicationPolicy


  class Scope < Scope
    def resolve
      if user.present? && user.admin?
        scope.all
      else
        scope.where hide: false
      end
    end
  end

  def update?
    user.present?
  end

  def show?
    (user.present? && user.admin?) or not record.hide?
  end

  def edit
    
  end

end
