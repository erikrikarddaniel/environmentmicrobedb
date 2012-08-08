# == Schema Information
#
# Table name: otus
#
#  id                   :integer         not null, primary key
#  created_at           :datetime        not null
#  updated_at           :datetime        not null
#  annotation_source_id :integer
#  name                 :string(255)
#

require 'spec_helper'

describe Otu do
  pending "add some examples to (or delete) #{__FILE__}"
end
