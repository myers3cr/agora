class Job < ActiveRecord::Base
  attr_accessible :bid_due, :category, :customer, :delivery_due, :description, :instructions, :jobname

  validates_presence_of :jobname
  validates_presence_of :status
  validates_presence_of :description
  validates_presence_of :bid_due
  validates_presence_of :delivery_due
  
  

end
