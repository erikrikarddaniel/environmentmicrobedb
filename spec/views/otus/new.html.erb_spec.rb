require 'spec_helper'

describe "otus/new" do
  before(:each) do
    assign(:otu, stub_model(Otu).as_new_record)
  end

  it "renders new otu form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => otus_path, :method => "post" do
    end
  end
end
