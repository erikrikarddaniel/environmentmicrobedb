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
  pending "add some examples to (or delete) #{__FILE__}"
end
