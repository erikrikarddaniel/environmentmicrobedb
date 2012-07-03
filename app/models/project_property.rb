# == Schema Information
#
# Table name: project_properties
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  value      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  project_id :integer
#

class ProjectProperty < ActiveRecord::Base
  attr_accessible :name, :value
  belongs_to :project
  validates_presence_of :name, :value, :project_id
end
