class WikiPolicy < ApplicationPolicy

  # What collections a user can see users `.where` 
  class Scope < Scope

    def resolve
      if user && user.role == 'admin'
        scope.all 
      elsif user
        (scope.where("hide = :hide or wikis.user_id = :owner_id", {hide: false, owner_id: user.id}) + scope.joins(:collaborations).where("collaborations.user_id = :collaborator_id", {collaborator_id: user.id})).uniq
      else 
        scope.where hide: false
      end
    end
  end


  #Policies are boolean logic true or false to determine if a user has access to a controller action.
  def update?
    edit?
  end

  def premium?
    (user && user.role == "premium") && (record.user == user)
  end

  def show?
    (user && user.role == "admin") || record.hide == false || record.user == user || (user && record.users.pluck(:id).include?(user.id))
  end

  def edit?
    (user && user.role == 'admin') || (user && record.hide == false) || (user && record.users.pluck(:id).include?(user.id)) || record.user == user 
  end

end

