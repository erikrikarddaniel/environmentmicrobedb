FactoryGirl.define do
  factory :annotation_source do
    dbname 'Annotation db'
    dbversion '1.0'
    algorithm 'Assembly, FGS, blastp, Megan'
    algorithm_parameters 'Assembly: Velvet-Oasis'
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
  factory :sample do
    code "Test sample"
    sample_set
  end
  
  factory :subject_property do
    name "sub_prop_type"
    value "sub_prop_value"
    datatype "string"
    subject
  end
  
  factory :subject do
    code "Test subject"
  end
end
