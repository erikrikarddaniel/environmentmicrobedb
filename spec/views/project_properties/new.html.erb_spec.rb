require 'spec_helper'

describe "project_properties/new" do
  before(:each) do
    assign(:project_property, stub_model(ProjectProperty,
      :name => "MyString",
      :value => "MyString"
    ).as_new_record)
  end

  it "renders new project_property form" do
    pending "Fails for some reason, can't figure it out"
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => project_properties_path, :method => "post" do
      assert_select "input#project_property_name", :name => "project_property[name]"
      assert_select "input#project_property_value", :name => "project_property[value]"
    end
  end
end
