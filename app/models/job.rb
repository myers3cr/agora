class Job < ActiveRecord::Base
#  attr_accessible :bid_due, :category, :customer, :delivery_due, :description, :instructions, :jobname

  validates_presence_of :jobname
  validates_presence_of :description
  
  validate :bid_due_one_hour_in_future, :delivery_due_after_bid_due
  
  validates_presence_of :status 
  
  before_validation do |job|
    job.status = "new" if job.status.blank?
  end

private
  
  def bid_due_one_hour_in_future
    errors.add(:bid_due, "must be present") unless bid_due
    errors.add(:bid_due, "must be at least 1 hour in the future") unless bid_due && (bid_due - Time.now.localtime) >= 1.hour
  end

  def delivery_due_after_bid_due
    errors.add(:delivery_due, "must be present") unless delivery_due
    errors.add(:delivery_due, "must be after bid due") unless (bid_due && delivery_due) && (delivery_due > bid_due)
  end

end
