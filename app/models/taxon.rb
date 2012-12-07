# == Schema Information
#
# Table name: taxons
#
#  id                :integer         not null, primary key
#  name              :string(255)
#  created_at        :datetime        not null
#  updated_at        :datetime        not null
#  source_identifier :string(255)
#  rank              :string(255)
#  parent_id         :integer
#  source_db         :string(255)
#  domain            :string(255)
#  kingdom           :string(255)
#  phylum            :string(255)
#  organism_class    :string(255)
#  order             :string(255)
#  family            :string(255)
#  genus             :string(255)
#  species           :string(255)
#

class Taxon < AnnotationTarget
  attr_accessible :parent_id
  belongs_to :parent, :class_name => "Taxon", foreign_key: :parent_id
  has_many :children, :class_name => "Taxon", foreign_key: :parent_id
  has_many :cdna_observations, through: :cdna_observation_taxons
  has_many :cdna_observation_taxons
end
