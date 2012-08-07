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

class Observation < ActiveRecord::Base
  attr_accessible :sample_id, :observation_type
  belongs_to :sample
  validates_presence_of :sample_id, :observation_type
end


