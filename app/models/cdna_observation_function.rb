# == Schema Information
#
# Table name: cdna_observation_functions
#
#  id                  :integer         not null, primary key
#  cdna_observation_id :integer
#  function_id         :integer
#  created_at          :datetime        not null
#  updated_at          :datetime        not null
#

class CdnaObservationFunction < CdnaObservationAnnotation
  belongs_to :function
end
