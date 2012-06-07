# == Schema Information
#
# Table name: properties
#
#  id         :integer         not null, primary key
#  property   :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  value      :string(255)
#

class Property < ActiveRecord::Base
  attr_accessor :property, :value
  
  def initialize(property,value)
    @property = property
    @value = value
  end 
end
