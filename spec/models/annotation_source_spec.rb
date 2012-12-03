# == Schema Information
#
# Table name: annotation_sources
#
#  id                   :integer         not null, primary key
#  dbname               :string(255)
#  dbversion            :string(255)
#  algorithm            :string(255)
#  algorithm_parameters :string(255)
#  created_at           :datetime        not null
#  updated_at           :datetime        not null
#

require 'spec_helper'

describe AnnotationSource do
  before(:each) do
    @annotation_source = AnnotationSource.new(dbname: 'DB', dbversion: '1.0', algorithm: 'test', algorithm_parameters: 'test')
  end

  subject { @annotation_source }

  it { should respond_to(:dbname) }
  it { should respond_to(:dbversion) }
  it { should respond_to(:algorithm) }
  it { should respond_to(:algorithm_parameters) }
  it { should respond_to(:otus) }
  it { should respond_to(:functions) }

  describe 'name is required' do
    before do
      @annotation_source.dbname = ''
    end
    it { should_not be_valid }
  end
end
