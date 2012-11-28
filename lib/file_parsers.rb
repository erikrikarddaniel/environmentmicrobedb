module FileParsers
  IMPORT_N_SEQS = 1000

  def import_frag_gene_scan(assembly, io)
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
end
