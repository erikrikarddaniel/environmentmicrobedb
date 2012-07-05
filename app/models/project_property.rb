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
#  datatype   :string(255)
#

class ProjectProperty < ActiveRecord::Base
  attr_accessible :name, :value, :datatype
  belongs_to :project
  validates_presence_of :name, :value, :project_id, :datatype
  validates :datatype,  :inclusion => { :in => GlobalConstants::PROPERTY_TYPE.keys,
    :message => "%{value} is not a valid data type" }
  validate :convert_value
  def convert_value
    if GlobalConstants::PROPERTY_TYPE[self.datatype][:can_convert?].call(self.value) == :error
      errors.add(:error,"can't convert to #{self.datatype}")
    else
      GlobalConstants::PROPERTY_TYPE[self.datatype][:can_convert?].call(self.value)
    end
  end
end
