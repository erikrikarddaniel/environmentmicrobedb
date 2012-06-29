require 'spec_helper'

describe "properties/new" do
  before(:each) do
    assign(:property, stub_model(Property).as_new_record)
  end

  it "renders new property form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => properties_path, :method => "post" do
    end
  end
end
