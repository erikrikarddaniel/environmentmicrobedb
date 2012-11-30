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
  before do
   @assembly = FactoryGirl.create(:assembly)
  end

  subject { @assembly }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:project) }

  describe "Should not be valid when name is not present" do
    before { @assembly.name = "" }
    it { should_not be_valid }
  end

  describe "only one name per project" do
    before do
      @a1 = Assembly.new(name: @assembly.name, project_id: @assembly.project_id)
    end
    subject { @a1 }

    it { should_not be_valid }
  end
end
