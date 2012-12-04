# == Schema Information
#
# Table name: cdna_observation_taxons
#
#  id                  :integer         not null, primary key
#  cdna_observation_id :integer
#  taxon_id            :integer
#  created_at          :datetime        not null
#  updated_at          :datetime        not null
#

class CdnaObservationTaxon < CdnaObservationAnnotation
  belongs_to :taxon
end
