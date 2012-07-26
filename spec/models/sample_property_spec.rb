# == Schema Information
#
# Table name: sample_properties
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  value      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  sample_id  :integer
#  datatype   :string(255)
#

require 'spec_helper'

describe SampleProperty do
  let!(:sample_property) { FactoryGirl.create(:sample_property) }

  describe "#attributes" do
    it "has :name" do
      sample_property.name.should be
    end
    it "has :value" do
      sample_property.value.should be
    end
  end
end
