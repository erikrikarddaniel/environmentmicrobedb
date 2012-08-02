# == Schema Information
#
# Table name: subject_properties
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  value      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  subject_id :integer
#  datatype   :string(255)
#

require 'spec_helper'

describe SubjectProperty do
  let!(:subject_property) { FactoryGirl.create(:subject_property) }

  describe "#attributes" do
    it "has :name" do
      subject_property.name.should be
    end
    it "has :value" do
      subject_property.value.should be
    end
  end
end
