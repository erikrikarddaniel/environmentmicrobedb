# == Schema Information
#
# Table name: orfs
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  orf_set_id :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe Orf do
  let(:orf_set) { FactoryGirl.create(:orf_set) }

  before do
    @orf = orf_set.orfs.create(name: 'test ORF')
  end

  subject { @orf }

  it { should respond_to(:name) }

  describe "Should not be valid when name is not present" do
    before { @orf.name = "" }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to orf_set_id" do
      expect do
        OrfSet.new(name: 'n', orf_set_id: orf_set.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

  describe "only one name per orf_set" do
    before do
      @o = @orf.orf_set.orfs.new(name: @orf.name)
    end
    subject { @o }

    it { should_not be_valid }
  end
end
