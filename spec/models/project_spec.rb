# == Schema Information
#
# Table name: projects
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe Project do
  let!(:project) { FactoryGirl.create(:project) }

  let!(:project_property){ FactoryGirl.create(:project_property, project: project) }
  describe "#attributes" do
    it "has :name" do
      project.name.should be
    end
    it "has :properties" do
      project.properties.length.should  == 1
    end
  end
end
