# == Schema Information
#
#
#  id               :integer         not null, primary key
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#  sample_id        :integer
#  out_id           :integer
#  n_specific       :integer
#  n_unspecific     :double
#

class BioObservation < Observation
  self.abstract_class = true
  attr_accessible :n_specific,:n_unspecific, :otu_id, :function0_id, :function1_id, :taxon0_id
  belongs_to :otu
  belongs_to :function0, class_name: "Function", foreign_key: :function0_id
  belongs_to :function1, class_name: "Function", foreign_key: :function1_id
  belongs_to :taxon0, class_name: "Taxon", foreign_key: :taxon0_id
end
