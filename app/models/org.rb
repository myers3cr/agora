class Org < ActiveRecord::Base

  belongs_to :currency
  belongs_to :org_type
  
  validates_presence_of :org_name
  validates_uniqueness_of :org_name
  validates_length_of :org_name, :maximum => 32
  
  validates_presence_of :org_type_id
  
  validates_presence_of :currency_id
  
end
