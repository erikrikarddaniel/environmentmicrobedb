# == Schema Information
#
# Table name: samples
#
#  id            :integer         not null, primary key
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#  code          :string(255)
#  sample_set_id :integer
#  subject_id    :integer
#

require 'spec_helper'

describe Sample do
  before do
    @sample = FactoryGirl.create(:sample)
  end

  subject { @sample }

  it { should respond_to(:code) }
  it { should respond_to(:project) }
  it { should respond_to(:properties) }
  it { should respond_to(:cdna_observations) }
end
