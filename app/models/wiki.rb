class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborations, dependent: :destroy
  has_many :users, through: :collaborations

  def self.my_wikis(user)
    joins(:collaborations).where("collaborations.user_id = :collaborator_id", { collaborator_id: user.id})
  end


  def owner
    user
  end

  def collaborators
    users
  end

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
 
end
