class WikiPolicy < ApplicationPolicy

  # What collections a user can see users `.where` 
  class Scope < Scope

    def resolve
      if user && user.role == 'admin'
        scope.all? 
      elsif user
        scope.joins(:collaborations).where("hide = :hide or user_id = :owner_id or collaborations.user_id = :collaborator_id", {hide: false, owner_id: user.id, collaborator_id: user.id})
      else 
        scope.where hide: false
      end
    end
  end


  #Policies are boolean logic true or false to determine if a user has access to a controller action.
  def update?
    user.id == record.owner.id || user.role == 'admin' || record.collaborators.pluck(:id).include? user.id
  end

  def show?
    (user.present? && user.admin?) or not record.hide?
  end

  def premium?
    user.admin? or user.premium?
  end

  def edit?
    
  end

end
