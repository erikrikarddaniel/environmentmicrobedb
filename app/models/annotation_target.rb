# == Schema Information
#
#
#  id               :integer         not null, primary key
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#  name             :string

class Nucleotide < BioObservation
  self.abstract_class = true
  attr_accessible :name
end




