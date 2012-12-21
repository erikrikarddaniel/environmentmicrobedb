module BiosqlWeb
  BASE_URL = 'http://biosql.scilifelab.se'

  def self.functional_hierarchy(source_db, name)
    options = {:headers => { 'Content-Type' => 'application/json', 'Accepts' => 'application/json'}, :body => {source_db: source_db, name: name}.to_json}
    response = HTTParty.get(BASE_URL + '/functional_hierarchy.json', options)
    if response.headers['status'] == "200"
      response.parsed_response
    else
      JSON.parse("[]")
    end
  end

  def self.ncbi_taxon_id2full_taxon_hierarchy(ncbi_taxon_id)
    options = {:headers => { 'Content-Type' => 'application/json', 'Accepts' => 'application/json'}, :body => {:ncbi_taxon_id => ncbi_taxon_id}.to_json}
    response = HTTParty.get(BASE_URL + '/ncbi_taxon_id2full_taxon_hierarchy.json', options)
    if response.headers['status'] == "200"
      response.parsed_response
    else
      JSON.parse("[]")
    end
  end
end
