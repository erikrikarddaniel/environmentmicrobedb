# == Schema Information
#
# Table name: functions
#
#  id                :integer         not null, primary key
#  name              :string(255)
#  parent_id         :integer
#  created_at        :datetime        not null
#  updated_at        :datetime        not null
#  source_db         :string(255)
#  rank              :string(255)
#  source_identifier :string(255)
#  level0            :string(255)
#  level1            :string(255)
#  level2            :string(255)
#  level3            :string(255)
#  level4            :string(255)
#  leaf              :string(255)
#

class Function < AnnotationTarget
  attr_accessible :parent_id
  belongs_to :parent, :class_name => "Function", :foreign_key => "parent_id"
  has_many :children, :class_name => "Function", :foreign_key => "parent_id"
  has_many :cdna_observations, through: :cdna_observation_functions
  has_many :cdna_observation_functions
  #has_many :amplicons Make as above; no time now...
end
