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
#  domain            :string(255)
#  kingdom           :string(255)
#  phylum            :string(255)
#  organism_class    :string(255)
#  order             :string(255)
#  family            :string(255)
#  genus             :string(255)
#  species           :string(255)
#

require 'spec_helper'

describe Taxon do
  before do
    @ncbi_root = Taxon.create(name: 'NCBI root', source_db: 'NCBI')
    @ncbi_child0 = Taxon.create(name: 'NCBI child 0', parent_id: @ncbi_root.id, source_db: 'NCBI')
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
  it { should respond_to(:domain) }
  it { should respond_to(:kingdom) }
  it { should respond_to(:phylum) }
  it { should respond_to(:organism_class) }
  it { should respond_to(:order) }
  it { should respond_to(:family) }
  it { should respond_to(:genus) }
  it { should respond_to(:species) }

  describe "Required attributes" do
    it "should not be valid without name" do
      @ncbi_child0.name = ""
      @ncbi_child0.should_not be_valid
    end
    it "should not be valid without source_db" do
      @ncbi_child0.source_db = ""
      @ncbi_child0.should_not be_valid
    end
  end

  describe "parent should be another Taxon" do
    its(:parent) { should == @ncbi_root }
  end

  describe "name is unique but only within the same source_db and rank" do
    before do
      @t = Taxon.new(name: @ncbi_child0.name, source_db: @ncbi_child0.source_db, rank: 'another rank')
    end
    subject { @t }
    it { should be_valid }
  end

  describe "CdnaObservation associations" do
    before do
      @cdna = FactoryGirl.create(:cdna_observation)
      @ncbi_child0.cdna_observations << @cdna
    end
    its(:observations) { should == [ @cdna ] }
  end

  describe "given a source_identifier the object should be populated with data from Biosql" do
    before do
      @taxon = Taxon.create(name: "Escherichia coli K-12", source_db: "NCBI", source_identifier: "83333")
    end
    subject { @taxon }
    its(:species) { should == "Escherichia coli" }

    it "should not fail on missing source identifiers" do
      @t = Taxon.create(name: "No real name", source_db: "NCBI", source_identifier: "999999999999")
    end
  end

  describe "create or find from parsed json" do
    before do
      @taxon = Taxon.find_or_create_from_json(JSON.parse(<<JSON
{ "source_db": "NCBI", "source_identifier": "562" }
JSON
      ))
    end

    subject { @taxon }

    its(:name) { should == 'Escherichia coli' }
    its(:source_db) { should == 'NCBI' }
    its(:source_identifier) { should == '562' }
  end
end
