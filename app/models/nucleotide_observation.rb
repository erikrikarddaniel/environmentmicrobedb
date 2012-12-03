# == Schema Information
#
#
#  id               :integer         not null, primary key
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#  sample_id        :integer
#  n_specific       :integer
#  n_unspecific     :double
#

class NucleotideObservation < BioObservation
  self.abstract_class = true
end
