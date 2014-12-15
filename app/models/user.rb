class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :wikis
  has_many :collaborations 
  has_many :cowikis, through: :collaborations, source: :wiki

  validates :name, presence: true

  after_initialize :init

  def admin?
    role == 'admin'
  end

  def premium?
    role == 'premium'
  end

  def standard?
    role == 'standard'
  end

private
  def init
    if self.new_record? && self.role.nil?
      self.role = 'standard'
    end
  end
end
