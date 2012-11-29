# == Schema Information
#
# Table name: assemblies
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :string(255)
#  project_id  :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

require 'spec_helper'

describe Assembly do
  let(:project) { FactoryGirl.create(:project) }

  before do
   @assembly = project.assemblies.create(name: 'Test assembly')
  end

  subject { @assembly }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:project) }

  describe "Should not be valid when name is not present" do
    before { @assembly.name = "" }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to project_id" do
      expect do
        OrfSet.new(name: 'n', project_id: project.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

  describe "name uniqueness" do
    before do
      @a1 = project.assemblies.new(name: @assembly.name)
    end
    subject { @a1 }

    it { should_not be_valid }
  end
end
