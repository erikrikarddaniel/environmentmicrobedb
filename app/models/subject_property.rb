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
#

class SubjectProperty < ActiveRecord::Base
  belongs_to :subject
  validates_presence_of :name
  validates_presence_of :value
end
