# == Schema Information
#
# Table name: subject_properties
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  value      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  subject_id :integer
#  datatype   :string(255)
#

class SubjectProperty < ActiveRecord::Base
  attr_accessible :name, :value, :datatype
  belongs_to :subject
  validates_presence_of :name, :value, :datatype, :subject_id
  validates :datatype,  :inclusion => { :in => GlobalConstants::PROPERTY_TYPE.keys,
    :message => "%{value} is not a valid data type" }
  validate :convert_value
  def convert_value
    if GlobalConstants::convert(self.datatype,self.value) == :error
      errors.add(:error,"can't convert to #{datatype}")
    else
      GlobalConstants::convert(self.datatype,self.value)
    end
  end
end
