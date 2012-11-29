# == Schema Information
#
# Table name: orf_sets
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :string(255)
#  assembly_id :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class OrfSet < ActiveRecord::Base
  attr_accessible :name, :description
  belongs_to :assembly
  has_many :orfs, dependent: :destroy
  validates :name, presence: true, uniqueness: { :scope => :assembly_id }
  validates :assembly_id, presence: true
end
