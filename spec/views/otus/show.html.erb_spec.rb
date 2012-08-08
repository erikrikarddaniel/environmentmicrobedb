require 'spec_helper'

describe "otus/show" do
  before(:each) do
    @otu = assign(:otu, stub_model(Otu))
  end

  it "renders attributes in <p>" do
    render
  end
end
