# == Schema Information
#
# Table name: samples
#
#  id         :integer         not null, primary key
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  code       :string(255)
#

class Sample < ActiveRecord::Base
  has_many :properties, :class_name => "SampleProperty", :dependent => :destroy
  validates_presence_of :code
  accepts_nested_attributes_for :properties, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
end