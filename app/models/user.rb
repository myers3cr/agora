class User < ActiveRecord::Base

  belongs_to :org
  
  validates :name, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :org_id, presence: true
  validates :email, presence: true
  validates :phone, presence: true

  has_secure_password
  
  def fullname
    self.first_name + ' ' + self.last_name
  end

end
