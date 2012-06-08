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
  before(:each) do
    @project = FactoryGirl.create(:project)
  end
  it "has name" do
    @project.name.should be
  end
  it "has properties" do
    @project = FactoryGirl.create(:project_with_property)
    @project.properties.should have(1).Property
  end
end
