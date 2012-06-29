require 'spec_helper'

describe "samples/show" do
  before(:each) do
    @sample = assign(:sample, stub_model(Sample))
  end

  it "renders attributes in <p>" do
    render
  end
end
