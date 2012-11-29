require 'spec_helper'

describe "orf_sets/show" do
  before(:each) do
    @orf_set = assign(:orf_set, stub_model(OrfSet,
      :name => "Name",
      :description => "Description",
      :assembly_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
