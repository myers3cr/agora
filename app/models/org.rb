class Org < ActiveRecord::Base

# TODO add validations

  belongs_to :currency
  
  validates_presence_of :org_name
  
  validates_presence_of :org_type
  
  validates_presence_of :currency_id
  
end
