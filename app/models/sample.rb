# == Schema Information
#
# Table name: samples
#
#  id            :integer         not null, primary key
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#  code          :string(255)
#  sample_set_id :integer
#

class Sample < ActiveRecord::Base
  attr_accessible :code
  has_many :properties, class_name: "SampleProperty", dependent: :destroy
  belongs_to :sample_set
  validates_presence_of :code, :sample_set_id
  accepts_nested_attributes_for :properties, reject_if: lambda { |a| a[:name].blank? }, allow_destroy: true
end
