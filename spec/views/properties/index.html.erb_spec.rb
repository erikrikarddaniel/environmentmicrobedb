require 'spec_helper'

describe "properties/index" do
  before(:each) do
    assign(:properties, [
      stub_model(Property,
        :property => 1,
        :value => "Value"
      ),
      stub_model(Property,
        :property => 1,
        :value => "Value"
      )
    ])
  end

  it "renders a list of properties" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Value".to_s, :count => 2
  end
end
