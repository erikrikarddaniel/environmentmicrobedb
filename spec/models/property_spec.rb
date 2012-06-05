# == Schema Information
#
# Table name: properties
#
#  id         :integer         not null, primary key
#  property   :integer
#  value      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe Property do
  it "Can be created" do
    Property.new.should be_an_instance_of(Property)
  end
  it "Can be saved successfully" do
    Property.create.should be_persisted
  end

end
