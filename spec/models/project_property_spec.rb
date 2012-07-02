# == Schema Information
#
# Table name: project_properties
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  value      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  project_id :string(255)
#

require 'spec_helper'

describe ProjectProperty do
  pending "add some examples to (or delete) #{__FILE__}"
end
