class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborations, dependent: :destroy
  has_many :users, through: :collaborations

  def owner
    user
  end

  def collaborators
    users
  end

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
 
end
