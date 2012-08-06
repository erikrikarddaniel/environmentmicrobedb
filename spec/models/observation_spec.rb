# == Schema Information
#
# Table name: observations
#
#  id               :integer         not null, primary key
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#  sample_id        :integer
#  observation_type :string(255)
#

require 'spec_helper'

describe Observation do
  pending "add some examples to (or delete) #{__FILE__}"
end
