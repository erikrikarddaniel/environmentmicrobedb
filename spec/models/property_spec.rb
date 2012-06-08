# == Schema Information
#
# Table name: properties
#
#  id         :integer         not null, primary key
#  property   :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  value      :string(255)
#  project_id :integer
#

require 'spec_helper'

describe Property do  
  before(:each) do
    @property = FactoryGirl.create(:property)
  end
  describe "#attributes" do
    it "has :property" do
      @property.property.should be
    end
    it "has :value" do
      @property.value.should be
    end
  end
end
