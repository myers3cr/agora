class Job < ActiveRecord::Base
#  attr_accessible :bid_due, :category, :customer, :delivery_due, :description, :instructions, :jobname

  validates_presence_of :jobname
  validates_presence_of :status
  validates_presence_of :description
  # these seem to be handled by the validate lines, below
  # validates_presence_of :bid_due
  # validates_presence_of :delivery_due
  
  validate :bid_due_one_hour_in_future
  validate :delivery_due_after_bid_due
  
 
private
  
  def bid_due_one_hour_in_future
    errors.add(:bid_due, "must be present") unless bid_due
    errors.add(:bid_due, "must be at least 1 hour in the future") unless bid_due && (bid_due - Time.now) >= 1.hour
  end

  def delivery_due_after_bid_due
    errors.add(:delivery_due, "must be present") unless delivery_due
    errors.add(:delivery_due, "must be after bid due") unless (bid_due && delivery_due) && (delivery_due > bid_due)
  end

end
