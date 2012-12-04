# == Schema Information
#
# Table name: taxons
#
#  id                   :integer         not null, primary key
#  name                 :string(255)
#  created_at           :datetime        not null
#  updated_at           :datetime        not null
#  source_identifier    :string(255)
#  rank                 :string(255)
#  parent_id            :integer
#  annotation_source_id :integer
#

class Taxon < AnnotationTarget
  attr_accessible :parent_id
  belongs_to :parent, :class_name => "Taxon", foreign_key: :parent_id
  has_many :children, :class_name => "Taxon", foreign_key: :parent_id
  has_many :cdna_observation0s, class_name: "CdnaObservation", foreign_key: :taxon0_id
  has_many :cdna_observation1s, class_name: "CdnaObservation", foreign_key: :taxon1_id
end
