class WikiPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      if user.nil? || 
        scope.all
      else
        scope.where private: false
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
