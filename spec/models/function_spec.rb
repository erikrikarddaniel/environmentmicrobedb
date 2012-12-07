# == Schema Information
#
# Table name: functions
#
#  id                :integer         not null, primary key
#  name              :string(255)
#  parent_id         :integer
#  created_at        :datetime        not null
#  updated_at        :datetime        not null
#  source_db         :string(255)
#  rank              :string(255)
#  source_identifier :string(255)
#  level0            :string(255)
#  level1            :string(255)
#  level2            :string(255)
#  level3            :string(255)
#  level4            :string(255)
#  leaf              :string(255)
#

require 'spec_helper'

describe Function do
  before(:each) do
    @seed_root = Function.create(name: 'SEED root')
    @seed_child0 = Function.create(name: 'SEED child 0', parent_id: @seed_root.id)
  end

  subject { @seed_child0 }

  it { should_not respond_to(:annotation_source_id) }
  it { should_not respond_to(:annotation_source) }
  it { should respond_to(:children) }
  it { should respond_to(:name) }
  it { should respond_to(:observations) }
  it { should respond_to(:parent) }
  it { should respond_to(:rank) }
  it { should respond_to(:source_db) }
  it { should respond_to(:source_identifier) }
  it { should respond_to(:level0) }
  it { should respond_to(:level1) }
  it { should respond_to(:level2) }
  it { should respond_to(:level3) }
  it { should respond_to(:level4) }
  it { should respond_to(:leaf) }

  describe "Should not be valid when name is not present" do
    before { @seed_child0.name = "" }
    it { should_not be_valid }
  end

  describe "name is unique" do
    before do
      @f = Function.new(name: @seed_child0.name)
    end
    subject { @f }
    it { should_not be_valid }
  end

  describe "CdnaObservation associations" do
    before do
      @cdna = FactoryGirl.create(:cdna_observation)
      @seed_child0.cdna_observations << @cdna
    end
    its(:observations) { should == [ @cdna ] }
  end
end
