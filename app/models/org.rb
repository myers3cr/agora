class Org < ActiveRecord::Base

# TODO add validations

  belongs_to :currency
  belongs_to :org_type
  
  validates_presence_of :org_name
  
  validates_presence_of :org_type_id
  
  validates_presence_of :currency_id
  
end
