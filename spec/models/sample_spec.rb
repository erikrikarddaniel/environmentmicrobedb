# == Schema Information
#
# Table name: samples
#
#  id         :integer         not null, primary key
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  code       :string(255)
#

require 'spec_helper'

describe Sample do
  let!(:sample) { FactoryGirl.create(:sample) }

  let!(:sample_property){ FactoryGirl.create(:sample_property, sample: sample) }
  describe "#attributes" do
    it "has :code" do
      sample.code.should be
    end
    it "has :properties" do
      sample.properties.length.should  == 1
    end
  end
end
