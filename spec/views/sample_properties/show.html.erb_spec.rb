require 'spec_helper'

describe "sample_properties/show" do
  before(:each) do
    @sample_property = assign(:sample_property, stub_model(SampleProperty,
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
