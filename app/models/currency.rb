class Currency < ActiveRecord::Base
# TODO figure out why 'upcase!' is undefined when using callback
# before_validation :upcase_iso
  
  # iso-code validation
  validates_presence_of :iso_code
  validates_uniqueness_of :iso_code
  validates_format_of :iso_code, :with => /^[A-Z]{3}$/, :message => "must be 3 uppercase letters"
  
  # description validation
  validates_presence_of :description
  validates_length_of :description, :maximum => 32
  
  def upcase_iso
    self.iso_code.upcase!
  end
  
end
