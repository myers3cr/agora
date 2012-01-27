class User < ActiveRecord::Base
  attr_accessible :username, :first_name, :last_name, :org_id, :email, :phone, :password, :password_confirmation

  belongs_to :org
  
  validates :username, presence: true, uniqueness: { :case_sensitive => false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :org_id, presence: true
  validates :email, presence: true
  validates :phone, presence: true

  has_secure_password
  
  def full_name
    self.first_name + ' ' + self.last_name
  end

end
