# == Schema Information
#
# Table name: orfs
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  orf_set_id :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Orf < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { scope: :orf_set_id }
  belongs_to :orf_set
end
