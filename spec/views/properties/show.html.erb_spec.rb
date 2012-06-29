require 'spec_helper'

describe "properties/show" do
  before(:each) do
    @property = assign(:property, stub_model(Property))
  end

  it "renders attributes in <p>" do
    render
  end
end
