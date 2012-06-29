require 'spec_helper'

describe "samples/index" do
  before(:each) do
    assign(:samples, [
      stub_model(Sample),
      stub_model(Sample)
    ])
  end

  it "renders a list of samples" do
    render
  end
end
