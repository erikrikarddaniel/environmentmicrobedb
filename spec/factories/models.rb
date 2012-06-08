FactoryGirl.define do
  factory :property do
    property "prop_type"
    value "prop_value"
  end

  factory :project do
    name "test project"
  end
  factory :project_with_property, :parent => :project do |project|
    project.after_create { |a| Factory(:property, :project => a) }
  end
end