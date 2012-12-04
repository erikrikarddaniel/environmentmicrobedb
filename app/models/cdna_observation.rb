# == Schema Information
#
# Table name: cdna_observations
#
#  id           :integer         not null, primary key
#  sample_id    :integer
#  n_specific   :integer
#  n_unspecific :float
#  otu_id       :integer
#  function0_id :integer
#  function1_id :integer
#  taxon0_id    :integer
#  taxon1_id    :integer
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

class CdnaObservation < NucleotideObservation
end
