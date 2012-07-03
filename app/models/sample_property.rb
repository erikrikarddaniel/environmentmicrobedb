# == Schema Information
#
# Table name: sample_properties
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  value      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  sample_id  :integer
#

class SampleProperty < ActiveRecord::Base
  attr_accessible :name, :value
  belongs_to :sample
  validates_presence_of :name
  validates_presence_of :value
end
