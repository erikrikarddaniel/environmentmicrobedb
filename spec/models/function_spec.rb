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

  describe "Required attributes" do
    it "should not be valid without name" do
      @seed_child0.name = ""
      @seed_child0.should_not be_valid
    end
    it "should not be valid without source_db" do
      @seed_child0.source_db = ""
      @seed_child0.should_not be_valid
    end
  end

  describe "parent should be another Function" do
    its(:parent) { should == @ncbi_root }
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

  describe "create from parsed json" do
    before do
      @function = Function.find_or_create_from_json(JSON.parse(<<JSON
{ "name": "Manganese superoxide dismutase (EC 1.15.1.1)", "source_db": "SEED", "rank": "leaf" }
JSON
      ))
    end

    subject { @function }

    its(:name) { should == 'Manganese superoxide dismutase (EC 1.15.1.1)' }
    its(:source_db) { should == 'SEED' }
  end

  describe "find from parsed json" do
    before do
      @old_function = Function.create(name: "Nitrosative_stress", source_db: "SEED")
    end

    it "should find the already existing object" do
      @new_function = Function.find_or_create_from_json(JSON.parse(<<JSON
{ "name": "Nitrosative_stress", "source_db": "SEED", "rank": "leaf" }
JSON
      ))
      @new_function.should == @old_function
    end
  end

  describe "given a name and a source_db the object should be populated with data from Biosql" do
    before do
      @no_stress = Function.create(name: "Nitrosative_stress", source_db: "SEED")
    end

    subject { @no_stress }

    its(:leaf) { should == @no_stress.name }
    its(:level0) { should == 'SEED' }
  end

  describe "given a non-existing name and a source_db object should not fail" do
    before do
      @no_stress = Function.create(name: "does not exist", source_db: "SEED")
    end

    subject { @no_stress }

    its(:leaf) { should == @no_stress.name }
    its(:level0) { should == nil }
  end
end
