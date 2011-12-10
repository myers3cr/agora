class Org < ActiveRecord::Base
  
  belongs_to :currency
  belongs_to :org_type
  has_many :users
  
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_length_of :name, :maximum => 32
  
  validates_presence_of :org_type_id
  
  validates_presence_of :currency_id
  
end
