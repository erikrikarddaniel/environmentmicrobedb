# == Schema Information
#
# Table name: projects
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Project < ActiveRecord::Base
  has_many :properties, :dependent => :destroy
  validates_presence_of :name
  accepts_nested_attributes_for :properties, :reject_if => lambda { |a| a[:property].blank? }, :allow_destroy => true
end
