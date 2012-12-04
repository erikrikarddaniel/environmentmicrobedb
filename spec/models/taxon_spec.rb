# == Schema Information
#
# Table name: taxons
#
#  id                :integer         not null, primary key
#  name              :string(255)
#  created_at        :datetime        not null
#  updated_at        :datetime        not null
#  source_identifier :string(255)
#  rank              :string(255)
#  parent_id         :integer
#  source_db         :string(255)
#

require 'spec_helper'

describe Taxon do
  before do
    @ncbi_root = Taxon.create(name: 'NCBI root')
    @ncbi_child0 = Taxon.create(name: 'NCBI child 0', parent_id: @ncbi_root.id)
  end

  subject { @ncbi_child0 }

  it { should_not respond_to(:annotation_source_id) }
  it { should_not respond_to(:annotation_source) }
  it { should respond_to(:children) }
  it { should respond_to(:name) }
  it { should respond_to(:observations) }
  it { should respond_to(:parent) }
  it { should respond_to(:rank) }
  it { should respond_to(:source_db) }
  it { should respond_to(:source_identifier) }

  describe "Should not be valid when name is not present" do
    before { @ncbi_child0.name = "" }
    it { should_not be_valid }
  end

  describe "parent should be another Taxon" do
    its(:parent) { should == @ncbi_root }
  end

  describe "name is unique" do
    before do
      @t = Taxon.new(name: @ncbi_child0.name)
    end
    subject { @t }

    it { should_not be_valid }
  end

  describe "CdnaObservation associations" do
    before do
      @cdna = FactoryGirl.create(:cdna_observation)
      @ncbi_child0.cdna_observations << @cdna
    end
    its(:observations) { should == [ @cdna ] }
  end
end
