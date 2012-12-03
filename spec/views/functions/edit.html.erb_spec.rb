require 'spec_helper'

describe "functions/edit" do
  before(:each) do
    @function = assign(:function, stub_model(Function,
      :name => "MyString",
      :parent_id => 1
    ))
  end

  it "renders the edit function form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => functions_path(@function), :method => "post" do
      assert_select "input#function_name", :name => "function[name]"
      assert_select "input#function_parent_id", :name => "function[parent_id]"
    end
  end
end
