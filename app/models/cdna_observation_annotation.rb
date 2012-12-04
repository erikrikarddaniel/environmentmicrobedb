class CdnaObservationAnnotation < ActiveRecord::Base
  self.abstract_class = true
  belongs_to :cdna_observation
end
