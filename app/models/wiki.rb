class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :editors, dependent: :destroy

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
 
end
