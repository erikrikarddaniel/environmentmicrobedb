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
  let!(:sample_set) { FactoryGirl.create(:sample_set ,project: project)}

  describe "#attributes" do
    it "has :name" do
      project.name.should be
    end
    it "has :properties" do
      project.properties.length.should  == 1
    end
    it "can create property" do
      prop = project.properties.create(name: "prop1",value: "value1", datatype: "string")
      prop.should be_valid
    end
    it "can not create property with invalid convertion" do
      prop = project.properties.create(name: "prop2",value: "value2", datatype: "integer")
      prop.should_not be_valid
    end
    it "can not update property with invalid convertion" do
      prop = project.properties.create(name: "prop3",value: "value3", datatype: "string")
      prop.should be_valid
      prop.datatype="integer"
      prop.save
      prop.should_not be_valid
    end
  end

  describe "#sample sets" do
    it "has sample set" do
      project.sample_sets.count.should be > 0
    end
  end
end
