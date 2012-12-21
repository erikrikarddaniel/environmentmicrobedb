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
  attr_accessible :n_specific,:n_unspecific, :otu_id, :function0_id, :function1_id, :taxon0_id, :annotation_source_id
  belongs_to :annotation_source
  belongs_to :sample

  def project
    sample_set.project
  end

  def sample_set
    sample.sample_set
  end
end
