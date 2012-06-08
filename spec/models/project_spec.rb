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
    @project = Project.create!(:name=> "test project1")
  end
  it "Should be created" do
    @project.should be_an_instance_of(Project)
  end
  it "Should have a name" do
    @project.name.should eql("test project1")
  end
  it "Should have many properties" do
    @project.should have_many(Property)
  end
end
