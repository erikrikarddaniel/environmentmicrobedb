# == Schema Information
#
# Table name: cdna_observations
#
#  id           :integer         not null, primary key
#  sample_id    :integer
#  n_specific   :integer
#  n_unspecific :float
#  otu_id       :integer
#  function0_id :integer
#  function1_id :integer
#  taxon0_id    :integer
#  taxon1_id    :integer
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

require 'spec_helper'

describe CdnaObservation do
  let(:kegg) { FactoryGirl.create(:kegg_child0) }
  let(:seed) { FactoryGirl.create(:seed_child0) }
  let(:ncbi) { FactoryGirl.create(:ncbi_child0) }

  before do
    @cdna = CdnaObservation.create(
      function0_id: seed.id,
      function1_id: kegg.id,
      taxon0_id: ncbi.id,
      n_specific: 40
    )
  end

  subject { @cdna }

  it { should respond_to(:n_specific) }
  it { should respond_to(:n_unspecific) }
  it { should respond_to(:function0) }
  it { should respond_to(:function1) }
  it { should respond_to(:taxon0) }

  describe "Should not be valid when sample is not present" do
    before { @cdna.sample = nil }
    it { should_not be_valid }
  end

  describe "annotation associations" do
    its(:function0) { should == seed }
    its(:function1) { should == kegg }
    its(:taxon0) { should == ncbi }
  end
end
