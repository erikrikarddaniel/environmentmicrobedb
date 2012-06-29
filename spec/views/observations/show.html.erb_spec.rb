require 'spec_helper'

describe "observations/show" do
  before(:each) do
    @observation = assign(:observation, stub_model(Observation))
  end

  it "renders attributes in <p>" do
    render
  end
end
