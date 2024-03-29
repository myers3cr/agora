class Message < ActiveRecord::Base

	# attr_accessible :headline, :content, :start_date, :end_date

	validates_presence_of :headline
	validates_length_of :headline, :maximum => 64
  validates_presence_of :content
  validates_presence_of :start_date
  validates_presence_of :end_date
	
	def self.current
	  where("start_date <= ? and end_date >= ?", Time.now, Time.now)
  end

end
