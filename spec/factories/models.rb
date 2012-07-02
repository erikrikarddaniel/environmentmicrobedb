FactoryGirl.define do
  factory :property do
    property "prop_type"
    value "prop_value"
    project
  end
  factory :project do
    name "test project"
  end  
end