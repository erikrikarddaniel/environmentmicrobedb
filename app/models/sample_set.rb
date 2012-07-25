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

class SampleSet < ActiveRecord::Base
  attr_accessible :name
  belongs_to :project
  has_many :samples, class_name: "Sample", dependent: :destroy
  validates_presence_of :project_id, :name
end
