# == Schema Information
#
# Table name: subjects
#
#  id         :integer         not null, primary key
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  code       :string(255)
#  project_id :integer
#

require 'spec_helper'

describe Subject do
  let!(:subject) { FactoryGirl.create(:subject) }

  let!(:subject_property){ FactoryGirl.create(:subject_property, subject: subject) }
  describe "#attributes" do
    it "has :code" do
      subject.code.should be
    end
    it "has :properties" do
      subject.properties.length.should  == 1
    end
  end
end
