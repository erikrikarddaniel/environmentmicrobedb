FactoryGirl.define do
  factory :annotation_source do
    dbname 'Annotation db'
    dbversion '1.0'
    algorithm 'Assembly, FGS, blastp, Megan'
    algorithm_parameters 'Assembly: Velvet-Oasis'
  end

  factory :cdna_observation do
    sample
  end

  factory :function do
    name 'Test function'
    source_db 'TEST'
  end

  factory :kegg_root, class: Function do
    name 'KEGG root'
    source_db 'TEST'
  end

  factory :kegg_child0, class: Function do
    name "KEGG child0"
    source_db 'TEST'
    parent { FactoryGirl.create(:kegg_root) }
  end

  factory :seed_root, class: Function do
    name 'SEED root'
    source_db 'TEST'
  end

  factory :seed_child0, class: Function do
    name "SEED child0"
    source_db 'TEST'
    parent { FactoryGirl.create(:seed_root) }
  end

  factory :project_property do
    name "proj_prop_type"
    value "proj_prop_value"
    datatype "string"
    project
  end

  factory :project do
    name "test project"
  end

  factory :sample do
    code "Test sample"
    sample_set
  end
  
  factory :sample_property do
    name "sample_prop_type"
    value "sample_prop_value"
    datatype "string"
    sample
  end
  
  factory :sample_set do
    name "Test sample"
    project
  end
  
  factory :subject do
    code "Test subject"
  end
  
  factory :subject_property do
    name "sub_prop_type"
    value "sub_prop_value"
    datatype "string"
    subject
  end

  factory :taxon do
    name "Test taxon"
    source_db 'TEST'
  end

  factory :ncbi_root, class: Taxon do
    name "NCBI root"
    source_db 'TEST'
  end

  factory :ncbi_child0, class: Taxon do
    name "NCBI child0"
    source_db 'TEST'
    parent { FactoryGirl.create(:ncbi_root) }
  end
end
