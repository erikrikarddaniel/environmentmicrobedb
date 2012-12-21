# == Schema Information
#
# Table name: cdna_observations
#
#  id                   :integer         not null, primary key
#  sample_id            :integer
#  n_specific           :integer
#  n_unspecific         :float
#  created_at           :datetime        not null
#  updated_at           :datetime        not null
#  annotation_source_id :integer
#

require 'spec_helper'
require 'file_parsers'

describe CdnaObservation do
  let(:kegg) { FactoryGirl.create(:kegg_child0) }
  let(:seed) { FactoryGirl.create(:seed_child0) }
  let(:ncbi) { FactoryGirl.create(:ncbi_child0) }

  before do
    @cdna = CdnaObservation.create(n_specific: 40)
    @cdna.functions << kegg
    @cdna.functions << seed
    @cdna.taxons << ncbi
  end

  subject { @cdna }

  it { should respond_to(:annotation_source) }
  it { should respond_to(:n_specific) }
  it { should respond_to(:n_unspecific) }
  it { should respond_to(:functions) }
  it { should respond_to(:project) }
  it { should respond_to(:sample) }
  it { should respond_to(:sample_set) }
  it { should respond_to(:taxons) }

  describe "Should not be valid when sample is not present" do
    before { @cdna.sample = nil }
    it { should_not be_valid }
  end

  describe "annotation associations" do
    its(:functions) { should == [ kegg, seed ] }
    its(:taxons) { should == [ ncbi ] }
  end

  describe "json" do
    before do
      @n_inserted = FileParsers.import_cdna_json(fixture_file_upload("/cdna_observations.json"))
      @cdna_observations = CdnaObservation.all
    end

    it 'should be correctly imported' do
      @n_inserted.should == 2
      @cdna_observations.map { |co| co.n_specific }.sort.should == [ 20, 40 ]
      @cdna_observations.map { |co| co.sample.code }.sort.should == [ 'Ca', 'Ca' ]
      @cdna_observations.map { |co| co.taxons[0].name }.sort.should == [ 'Escherichia coli', 'Escherichia coli K-12' ]
      @cdna_observations.map { |co| co.taxons[0].genus }.sort.should == [ 'Escherichia', 'Escherichia' ]
      @cdna_observations.map { |co| co.functions[0].leaf }.sort.should == [ 'Manganese superoxide dismutase (EC 1.15.1.1)', 'Manganese superoxide dismutase (EC 1.15.1.1)' ]
      @cdna_observations.map { |co| co.functions[1].leaf }.sort.should == [ 'K00266', 'K02667' ].sort
      @cdna_observations.map { |co| co.functions[1].level1 }.sort.should == [ 'Metabolism', 'Environmental Information Processing' ].sort
      @cdna_observations.map { |co| co.functions[1].level2 }.sort.should == [ 'Energy Metabolism', 'Signal Transduction' ].sort
      @cdna_observations.map { |co| co.functions[1].level3 }.sort.should == [ 'Nitrogen metabolism', 'Two-component system' ].sort
      @cdna_observations.map { |co| co.functions[1].level4 }.sort.should == [ 'K00266', 'K02667' ].sort
      @cdna_observations[0].annotation_source.should == @cdna_observations[1].annotation_source
      @cdna_observations[0].annotation_source.dbname.should == "NCBI NR"
      @cdna_observations[0].annotation_source.dbversion.should == "20121204"
      @cdna_observations[0].annotation_source.algorithm.should == "Velvet assembly, FragGeneScan ORF calling, blastp, Megan LCA"
      @cdna_observations[0].sample.should == @cdna_observations[1].sample
      @cdna_observations[0].sample.code.should == "Ca"
      @cdna_observations[0].sample_set.name.should == "Metatranscriptomes"
      @cdna_observations[0].project.name.should == "LNU:Atlantic_2010"
    end
  end
end
