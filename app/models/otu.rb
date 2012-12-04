# == Schema Information
#
# Table name: otus
#
#  id                   :integer         not null, primary key
#  created_at           :datetime        not null
#  updated_at           :datetime        not null
#  annotation_source_id :integer
#  name                 :string(255)
#

class Otu < CdnaAnnotationTarget
  has_many :amplicons
  has_many :cdna_observations, through: :cdna_observation_otus
  has_many :cdna_observation_otus
end
