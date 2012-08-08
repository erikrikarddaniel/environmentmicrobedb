# == Schema Information
#
# Table name: observations
#
#  id               :integer         not null, primary key
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#  sample_id        :integer
#

class Observation < ActiveRecord::Base
  self.abstract_class = true
  attr_accessible :sample_id
  belongs_to :sample
  validates :sample_id, :presence => true
end