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
  belongs_to :annotation_source
  validates :annotation_source_id, :presence => true
  validates :name, presence: true, uniqueness: { scope: :annotation_source_id }

  def observations
    cdna_observations
  end

private

  def cdna_observations
    cdna_observation0s + cdna_observation1s 
  end
end
