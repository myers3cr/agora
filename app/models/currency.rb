class Currency < ActiveRecord::Base
  validates_presence_of :iso_code, :description
  validates_uniqueness_of :iso_code
  validates_length_of :iso_code, :is => 3, :message => "must be 3 characters"
  validates_length_of :description, :maximum => 32
end
