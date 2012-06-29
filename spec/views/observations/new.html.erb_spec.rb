require 'spec_helper'

describe "observations/new" do
  before(:each) do
    assign(:observation, stub_model(Observation).as_new_record)
  end

  it "renders new observation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => observations_path, :method => "post" do
    end
  end
end
