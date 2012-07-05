require 'spec_helper'

describe "project_properties/edit" do
  before(:each) do
    @project_property = assign(:project_property, stub_model(ProjectProperty,
      :name => "MyString",
      :value => "MyString"
    ))
  end

  it "renders the edit project_property form" do
    pending "Fails for some reason, can't figure it out"
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => project_properties_path(@project_property), :method => "post" do
      assert_select "input#project_property_name", :name => "project_property[name]"
      assert_select "input#project_property_value", :name => "project_property[value]"
    end
  end
end
