require 'spec_helper'

describe "orf_sets/edit" do
  before(:each) do
    @orf_set = assign(:orf_set, stub_model(OrfSet,
      :name => "MyString",
      :description => "MyString",
      :assembly_id => 1
    ))
  end

  it "renders the edit orf_set form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => orf_sets_path(@orf_set), :method => "post" do
      assert_select "input#orf_set_name", :name => "orf_set[name]"
      assert_select "input#orf_set_description", :name => "orf_set[description]"
      assert_select "input#orf_set_assembly_id", :name => "orf_set[assembly_id]"
    end
  end
end
