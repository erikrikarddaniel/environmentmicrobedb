# == Schema Information
#
#
#  id                     :integer         not null, primary key
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  name                   :string
#  annotation_source_id   :integer
class AnnotationTarget < ActiveRecord::Base
  self.abstract_class = true
  attr_accessible :name
  has_many :amplicons
  belongs_to :annotation_source
  validates :annotation_source_id, :presence => true
  validates :name, presence: true, uniqueness: { scope: :annotation_source_id }
end




