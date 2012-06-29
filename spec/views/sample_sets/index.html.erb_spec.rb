require 'spec_helper'

describe "sample_sets/index" do
  before(:each) do
    assign(:sample_sets, [
      stub_model(SampleSet),
      stub_model(SampleSet)
    ])
  end

  it "renders a list of sample_sets" do
    render
  end
end
