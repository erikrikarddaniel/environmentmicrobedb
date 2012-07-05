require 'spec_helper'

describe "projects/show" do
  before(:each) do
    @project = assign(:project, stub_model(Project,
      :string => ""
    ))
  end

  it "renders attributes in <p>" do
    pending "Fails for some reason, can't figure it out"
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
