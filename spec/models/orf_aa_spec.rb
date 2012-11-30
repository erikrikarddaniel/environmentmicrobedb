# == Schema Information
#
# Table name: orf_aas
#
#  id          :integer         not null, primary key
#  identifier  :string(255)
#  assembly_id :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

require 'spec_helper'
require 'file_parsers'

include FileParsers

describe OrfAa do
  before do
    @orf_aa = FactoryGirl.create(:orf_aa)
  end

  subject { @orf_aa }

  it { should respond_to(:identifier) }

  describe "Should not be valid when identifier is not present" do
    before { @orf_aa.identifier = "" }
    it { should_not be_valid }
  end

  describe "FragGeneScan import" do
    before do
      @assembly = FactoryGirl.create(:assembly)
    end

    it "import_frag_gene_scan should import a 10 line .faa file" do
      import_frag_gene_scan(@assembly, fixture_file_upload('/fraggenescan.10.faa'))
      OrfAa.find_all_by_assembly_id(@assembly.id).length.should == 5
    end

    it "import_frag_gene_scan should import a 10000 line .faa file" do
      import_frag_gene_scan(@assembly, fixture_file_upload('/fraggenescan.10000.faa'))
      OrfAa.find_all_by_assembly_id(@assembly.id).length.should == 5000
    end
  end
end
