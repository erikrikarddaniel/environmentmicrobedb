# == Schema Information
#
# Table name: taxons
#
#  id                :integer         not null, primary key
#  name              :string(255)
#  created_at        :datetime        not null
#  updated_at        :datetime        not null
#  source_identifier :string(255)
#  rank              :string(255)
#  parent_id         :integer
#  source_db         :string(255)
#  domain            :string(255)
#  kingdom           :string(255)
#  phylum            :string(255)
#  organism_class    :string(255)
#  order             :string(255)
#  family            :string(255)
#  genus             :string(255)
#  species           :string(255)
#

require 'biosql_web'

class Taxon < AnnotationTarget
  RECOGNIZED_RANKS = {
    'superkingdom' =>	:domain,
    'kingdom' =>	:kingdom,
    'phylum' =>		:phylum,
    'class' =>		:organism_class,
    'order' =>		:order,
    'family' =>		:family,
    'genus' =>		:genus,
    'species' =>	:species
  }
  QUERY_KEYS = %w(source_db source_identifier)
 
  after_initialize do |t|
    t.lookup! if t.source_identifier
  end

  attr_accessible :parent_id, :rank, :domain, :kingdom, :phylum, :organism_class, :order, :family, :genus
  belongs_to :parent, :class_name => "Taxon", foreign_key: :parent_id
  has_many :children, :class_name => "Taxon", foreign_key: :parent_id
  has_many :cdna_observations, through: :cdna_observation_taxons
  has_many :cdna_observation_taxons

  def lookup!
    if source_db == 'NCBI' and ncbi_taxon_id = source_identifier.to_i
      hierarchy = BiosqlWeb.ncbi_taxon_id2full_taxon_hierarchy(ncbi_taxon_id)
      if ( not hierarchy ) or hierarchy.length == 0 
	logger.warn "#{__FILE__}:#{__LINE__}: Couldn't lookup hierarchy for NCBI taxon id: #{ncbi_taxon_id}, hierarchy: #{hierarchy ? hierarchy.inspect : "hierarchy nil"}"
	return
      end
      if not hierarchy[0]['scientific_name']
	logger.warn "#{__FILE__}:#{__LINE__}: Couldn't lookup hierarchy for NCBI taxon id: #{ncbi_taxon_id}, hierarchy: #{hierarchy ? hierarchy.inspect : "hierarchy nil"}"
	return
      end
      self.name ||= hierarchy[0]['scientific_name']
      self.rank = hierarchy[0]['node_rank']
      hierarchy.each do |tentry|
	if RECOGNIZED_RANKS[tentry['node_rank']]
	  eval "self.#{RECOGNIZED_RANKS[tentry['node_rank']]} = \"#{tentry['scientific_name']}\""
	end
      end
    else
      logger.warn "Do not know how to lookup for source_db #{source_db} and NCBI taxon id #{ncbi_taxon_id}"
    end
  end

private

  def self._query_keys
    QUERY_KEYS
  end
end
