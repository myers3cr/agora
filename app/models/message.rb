class Message < ActiveRecord::Base
  
  validates_presence_of :headline
  validates_length_of :headline, :maximum => 64
  
  validates_presence_of :content
  
  validates_presence_of :start_date
  
  validates_presence_of :end_date
  
end
