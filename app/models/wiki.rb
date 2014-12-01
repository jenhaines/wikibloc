class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborations, dependent: :destroy
  has_many :users, through: :collaborations

  scope :publicly_viewable, -> { where(hide: false) }
  scope :privately_viewable,  -> { where(hide: true) }

  def self.visible_to(user)
      user ? all : publicly_viewable
  end
  
  def self.can_edit(user)
    user.cowikis
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
