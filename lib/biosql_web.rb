module BiosqlWeb
  BASE_URL = 'http://biosql.scilifelab.se'

  def self.ncbi_taxon_id2full_taxon_hierarchy(ncbi_taxon_id)
    options = {:headers => { 'Content-Type' => 'application/json', 'Accepts' => 'application/json'}, :body => {:ncbi_taxon_id => ncbi_taxon_id}.to_json}
    warn "#{__FILE__}:#{__LINE__}: options: #{options.inspect}"
    response = HTTParty.get(BASE_URL + '/ncbi_taxon_id2full_taxon_hierarchy.json', options)
    warn "#{__FILE__}:#{__LINE__}: response: #{response.inspect}"
    response.parsed_response
  end
end
