require 'spec_helper'

describe "sample_sets/new" do
  before(:each) do
    assign(:sample_set, stub_model(SampleSet).as_new_record)
  end

  it "renders new sample_set form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sample_sets_path, :method => "post" do
    end
  end
end
