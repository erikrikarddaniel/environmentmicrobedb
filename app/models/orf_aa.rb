# == Schema Information
#
# Table name: orf_aas
#
#  id          :integer         not null, primary key
#  identifier  :string(255)
#  assembly_id :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class OrfAa < ActiveRecord::Base
  belongs_to :assembly
  validates :identifier, presence: true
end
