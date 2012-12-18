# == Schema Information
#
# Table name: cdna_observations
#
#  id           :integer         not null, primary key
#  sample_id    :integer
#  n_specific   :integer
#  n_unspecific :float
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
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

  it { should respond_to(:n_specific) }
  it { should respond_to(:n_unspecific) }
  it { should respond_to(:functions) }
  it { should respond_to(:taxons) }

  describe "Should not be valid when sample is not present" do
    before { @cdna.sample = nil }
    it { should_not be_valid }
  end

  describe "annotation associations" do
    its(:functions) { should == [ kegg, seed ] }
    its(:taxons) { should == [ ncbi ] }
  end

  describe "json import" do
    before do
      @n_inserted = FileParsers.import_cdna_json(fixture_file_upload("/cdna_observations.json"))
    end

    subject { @n_inserted }

    its(:length) { should == 2 }
  end
end
