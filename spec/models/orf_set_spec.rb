# == Schema Information
#
# Table name: orf_sets
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :string(255)
#  assembly_id :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

require 'spec_helper'

describe OrfSet do
  let(:assembly) { FactoryGirl.create(:assembly) }

  before do
    @orf_set = assembly.orf_sets.create(name: 'test ORF set', description: 'FGS')
  end

  subject { @orf_set }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:assembly) }

  describe "Should not be valid when name is not present" do
    before { @orf_set.name = "" }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to assembly_id" do
      expect do
        OrfSet.new(name: 'n', assembly_id: assembly.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

  describe "only one name per assembly" do
    before do
      @os = @orf_set.assembly.orf_sets.new(name: @orf_set.name)
    end
    subject { @os }

    it { should_not be_valid }
  end
end
