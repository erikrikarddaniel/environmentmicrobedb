# == Schema Information
#
#
#  id                     :integer         not null, primary key
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  name                   :string
class AnnotationTarget < ActiveRecord::Base
  self.abstract_class = true
  attr_accessible :name, :source_db, :source_identifier, :rank
  validates :name, presence: true, uniqueness: { scope: [ :source_db, :rank ] }
  validates :source_db, presence: true

  def self.find_or_create_from_json(parsed_json)
    qdata = {}
    _query_keys.each do |key|
      qdata[key] = parsed_json[key]
    end
    instance = self.where(qdata).first
    instance ||= self.new(parsed_json)
    instance.lookup!
    logger.debug "Saving #{instance.inspect}"
    instance.save!
    instance
  end

  def observations
    cdna_observations
  end

private

  def cdna_observations
    cdna_observation0s + cdna_observation1s 
  end
end
