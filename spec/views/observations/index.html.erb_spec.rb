require 'spec_helper'

describe "observations/index" do
  before(:each) do
    assign(:observations, [
      stub_model(Observation),
      stub_model(Observation)
    ])
  end

  it "renders a list of observations" do
    render
  end
end
