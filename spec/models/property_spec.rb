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

require 'spec_helper'

describe Property do
  before(:each) do
    @property = Property.new(:property=>"prop_type",:value=>"prop_value")
  end
  it "Can be created" do
    @property.should be_an_instance_of(Property)
  end
  it "Should have a property type" do
    @property.property.should == "prop_type"
  end
  it "Should have a property value" do
    @property.value.should == "prop_value"
  end

end
