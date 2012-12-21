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

  subject { project }

  it { should respond_to(:name) }
  it { should respond_to(:properties) }
  it { should respond_to(:sample_sets) }
  it { should respond_to(:samples) }

  describe "#attributes" do
    it "name is unique" do
      @new_project = Project.new(name: project.name)
      @new_project.should_not be_valid
    end
    it "has :properties" do
      project.properties.length.should  == 1
    end
    it "can create property" do
      prop = project.properties.create(name: "prop1",value: "value1", datatype: "string")
      prop.should be_valid
    end
    it "can not create property with invalid type" do
      prop = project.properties.create(name: "prop2",value: "value2", datatype: "integer")
      prop.should_not be_valid
    end
    it "can not update property with invalid type" do
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

  describe "create from json data" do
    before do
      @project = Project.find_or_create_from_json(JSON.parse(<<JSON
{
  "project": {
    "name": "LNU:Atlantic_2010",
    "sample_sets": [
      {
	"name": "Sample set 0",
	"samples": [
	  { "code": "Ca" },
	  { "code": "Cb" },
	  { "code": "AMa" },
	  { "code": "AMb" }
	]
      },
      {
	"name": "Sample set 1",
        "samples": [
	  { "code": "Na" },
	  { "code": "Nb" }
	]
      }
    ]
  }
}
JSON
      )['project'])
    end

    subject { @project }

    its(:name) { should == 'LNU:Atlantic_2010' }

    it "should have two samples sets -- one named, the other not -- with four and two samples respectively" do
      @project.sample_sets.length.should == 2
      @project.samples.length.should == 6
    end
  end
end
