class Currency < ActiveRecord::Base

# TODO update so can't delete if there are orgs using the currency

  has_many :orgs
  
  before_validation :upcase_iso

  validates_uniqueness_of :iso_code
  validates_format_of :iso_code, :with => /^[A-Z]{3}$/, :message => "must be 3 uppercase letters"
  
  validates_presence_of :description
  validates_length_of :description, :maximum => 32

  def upcase_iso
    self.iso_code.upcase! if self.iso_code
  end
  
end
