require 'spec_helper'

describe "subject_properties/show" do
  before(:each) do
    @subject_property = assign(:subject_property, stub_model(SubjectProperty,
      :name => "Name",
      :value => "Value"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Value/)
  end
end
