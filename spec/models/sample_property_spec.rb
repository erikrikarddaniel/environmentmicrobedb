# == Schema Information
#
# Table name: sample_properties
#
#  id            :integer         not null, primary key
#  name          :string(255)
#  value         :string(255)
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#  sample_set_id :string(255)
#

require 'spec_helper'

describe SampleProperty do
  pending "add some examples to (or delete) #{__FILE__}"
end
