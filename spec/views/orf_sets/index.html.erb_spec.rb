require 'spec_helper'

describe "orf_sets/index" do
  before(:each) do
    assign(:orf_sets, [
      stub_model(OrfSet,
        :name => "Name",
        :description => "Description",
        :assembly_id => 1
      ),
      stub_model(OrfSet,
        :name => "Name",
        :description => "Description",
        :assembly_id => 1
      )
    ])
  end

  it "renders a list of orf_sets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
