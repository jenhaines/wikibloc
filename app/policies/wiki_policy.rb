class WikiPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where.not(:private => true)
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
