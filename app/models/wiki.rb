class Wiki < ActiveRecord::Base
  belongs_to :user

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  after_initialize :init



private
  def init
    if self.new_record? && self.private.nil?
      self.private = false
    end
  end
end
