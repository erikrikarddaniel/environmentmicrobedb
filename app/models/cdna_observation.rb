# == Schema Information
#
# Table name: cdna_observations
#
#  id           :integer         not null, primary key
#  sample_id    :integer
#  n_specific   :integer
#  n_unspecific :float
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

class CdnaObservation < NucleotideObservation
  has_many :cdna_observation_otus
  has_many :cdna_observation_functions
  has_many :cdna_observation_taxons
  has_many :otus, through: :cdna_observation_otus
  has_many :functions, through: :cdna_observation_functions
  has_many :taxons, through: :cdna_observation_taxons
end
