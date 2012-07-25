# == Schema Information
#
# Table name: sample_sets
#
#  id         :integer         not null, primary key
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  project_id :integer
#  name       :string(255)
#

require 'spec_helper'

describe SampleSet do
  pending "add some examples to (or delete) #{__FILE__}"
end
