# == Schema Information
#
# Table name: functions
#
#  id                   :integer         not null, primary key
#  name                 :string(255)
#  parent_id            :integer
#  annotation_source_id :integer
#  created_at           :datetime        not null
#  updated_at           :datetime        not null
#  source_db            :string(255)
#  rank                 :string(255)
#

require 'spec_helper'

describe Function do
  let (:annotation_source) { FactoryGirl.create(:annotation_source) }

  before(:each) do
    @seed_root = annotation_source.functions.create(name: 'SEED root')
    @seed_child0 = annotation_source.functions.create(name: 'SEED child 0', parent_id: @seed_root.id)
  end

  subject { @seed_child0 }

  it { should respond_to(:name) }
  it { should respond_to(:annotation_source) }
  it { should respond_to(:parent) }
  it { should respond_to(:children) }
  it { should respond_to(:rank) }
  it { should respond_to(:source_db) }

  describe "Should not be valid when name is not present" do
    before { @seed_child0.name = "" }
    it { should_not be_valid }
  end

  describe "Should not be valid when annotation_source is not present" do
    before { @seed_child0.annotation_source = nil }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to annotation_source_id" do
      expect do
        Function.new(name: 'n', annotation_source_id: annotation_source.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "only one name per annotation_source" do
    before do
      @f = @seed_child0.annotation_source.functions.new(name: @seed_child0.name)
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
