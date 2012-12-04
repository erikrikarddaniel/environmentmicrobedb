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

require 'spec_helper'

describe CdnaObservationTaxon do
  pending "add some examples to (or delete) #{__FILE__}"
end
