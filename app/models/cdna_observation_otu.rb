# == Schema Information
#
# Table name: cdna_observation_otus
#
#  id                  :integer         not null, primary key
#  cdna_observation_id :integer
#  otu_id              :integer
#  created_at          :datetime        not null
#  updated_at          :datetime        not null
#

class CdnaObservationOtu < CdnaObservationAnnotation
  belongs_to :otu
end
