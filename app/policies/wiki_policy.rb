class WikiPolicy < ApplicationPolicy


  class Scope < Scope
    def resolve
      if user && user.admin?
        scope.all
      else
        scope.where hide: false
      end
    end
  end

  def update?
    user && user.admin?
  end

  def show?
    (user && user.admin?) or not record.hide?
  end

  def edit
    
  end

end
