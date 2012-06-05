require 'spec_helper'

describe "properties/edit" do
  before(:each) do
    @property = assign(:property, stub_model(Property,
      :property => 1,
      :value => "MyString"
    ))
  end

  it "renders the edit property form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => properties_path(@property), :method => "post" do
      assert_select "input#property_property", :name => "property[property]"
      assert_select "input#property_value", :name => "property[value]"
    end
  end
end
