class WikiPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      if user && (user.role == 'admin' )
        scope.all
      else
        scope.where hide: false
      end
    end
  end

  def update?
    user.admin? or not wiki.hide?
  end

  def edit
    raise Pundit::NotAuthorizedError, "must be logged in" unless user
  end


	# def index?
	# 	true
	# end

end
