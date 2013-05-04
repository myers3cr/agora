class OpenItem < ActiveRecord::Base
  attr_accessible :category, :description, :quantity

  CATEGORIES = ['Default', 'Promotional Items', 'Cardboard Products', 'Foamcore Products', 'Bespoke / Other']

  validates_presence_of :quantity
  validates_numericality_of :quantity, { only_integer: true, greater_than: 0 }
  validates_inclusion_of :category, in: CATEGORIES 
  validates_presence_of :description

end
