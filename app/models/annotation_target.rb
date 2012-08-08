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
  attr_accessible :name, :annotation_source_id
  has_many :amplicons
  belongs_to :annotation_source
  validates :name, :annotation_source_id, :presence => true
end




