module FileParsers
  IMPORT_N_SEQS = 1000

  def import_frag_gene_scan(assembly, io)
    nseqs = 0
    Assembly.transaction do
      @orfs = []
      File.open(io.path, "r").each_with_index do |line, i|
	line.chomp!
	if line[0] == '>'
	  nseqs += 1
	  @orfs << Orf.new(identifier: line[1..-1], assembly_id: assembly.id)
	end

	if @orfs.length > 0 and @orfs.length % IMPORT_N_SEQS == 0
	  Orf.import @orfs
	  @orfs = []
	end
      end
      Orf.import @orfs
    end

    nseqs
  end
end
