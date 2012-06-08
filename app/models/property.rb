# == Schema Information
#
# Table name: properties
#
#  id         :integer         not null, primary key
#  property   :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  value      :string(255)
#  project_id :integer
#

class Property < ActiveRecord::Base
  belongs_to :project
end
