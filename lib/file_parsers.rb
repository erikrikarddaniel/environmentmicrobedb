require 'json'

module FileParsers
  IMPORT_N_SEQS = 1000

  def FileParsers.import_frag_gene_scan(assembly, io)
    nseqs = 0
    Assembly.transaction do
      @orf_aas = []
      File.open(io.path, "r").each_with_index do |line, i|
	line.chomp!
	if line[0] == '>'
	  nseqs += 1
	  @orf_aas << OrfAa.new(identifier: line[1..-1], assembly_id: assembly.id)
	end

	if @orf_aas.length > 0 and @orf_aas.length % IMPORT_N_SEQS == 0
	  OrfAa.import @orf_aas
	  @orf_aas = []
	end
      end
      OrfAa.import @orf_aas
    end

    nseqs
  end

  def self.import_cdna_json(io)
    n_cdnas = 0
    AnnotationSource.transaction do
      cdna_data = JSON.parse(io.read)
      raise "Can't store observations without project data" unless cdna_data['project']
      @sample = Project.find_or_create_from_json(cdna_data['project']).samples.detect { |s| s.code == cdna_data['project']['sample_sets'][0]['samples'][0]['code'] }
      @annotation_source = AnnotationSource.create!(cdna_data['annotation_source'])
      cdna_data['cdna_observations'].each do |obs|
	functions = obs.delete('functions').map { |f| Function.find_or_create_from_json(f) }
	taxons = obs.delete('taxons').map { |f| Taxon.find_or_create_from_json(f) }
	cdna_observation = @sample.cdna_observations.create!(obs)
	cdna_observation.functions = functions
	cdna_observation.taxons = taxons
	cdna_observation.annotation_source = @annotation_source
	cdna_observation.save
	n_cdnas += 1
      end
    end
    n_cdnas
  end
end
