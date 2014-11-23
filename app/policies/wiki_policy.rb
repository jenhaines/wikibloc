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
    user.admin? or not wiki.private?
  end

	# def index?
	# 	true
	# end

end
