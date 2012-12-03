# == Schema Information
#
# Table name: functions
#
#  id                   :integer         not null, primary key
#  name                 :string(255)
#  parent_id            :integer
#  annotation_source_id :integer
#  created_at           :datetime        not null
#  updated_at           :datetime        not null
#

class Function < AnnotationTarget
  attr_accessible :parent_id
  belongs_to :parent, :class_name => "Function", :foreign_key => "parent_id"
  has_many :children, :class_name => "Function", :foreign_key => "parent_id"
end
