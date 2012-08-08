# == Schema Information
#
# Table name: amplicons
#
#  id           :integer         not null, primary key
#  sample_id    :integer
#  n_specific   :integer
#  n_unspecific :float
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

require 'spec_helper'

describe Amplicon do
  pending "add some examples to (or delete) #{__FILE__}"
end
