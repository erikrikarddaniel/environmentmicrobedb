# == Schema Information
#
# Table name: subjects
#
#  id         :integer         not null, primary key
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  code       :string(255)
#

class Subject < ActiveRecord::Base
  attr_accessible :code
  has_many :properties, class_name: "SubjectProperty", dependent: :destroy
  validates_presence_of :code
  accepts_nested_attributes_for :properties, reject_if: lambda { |a| a[:name].blank? }, allow_destroy: true
end