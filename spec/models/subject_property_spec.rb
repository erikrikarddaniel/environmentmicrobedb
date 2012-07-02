# == Schema Information
#
# Table name: subject_properties
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  value      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  sample_id  :string(255)
#

require 'spec_helper'

describe SubjectProperty do
  pending "add some examples to (or delete) #{__FILE__}"
end
