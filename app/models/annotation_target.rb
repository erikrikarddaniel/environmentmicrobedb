# == Schema Information
#
#
#  id                     :integer         not null, primary key
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  name                   :string
class AnnotationTarget < ActiveRecord::Base
  self.abstract_class = true
  attr_accessible :name, :source_db, :source_identifier
  validates :name, presence: true, uniqueness: true

  def observations
    cdna_observations
  end

private

  def cdna_observations
    cdna_observation0s + cdna_observation1s 
  end
end
