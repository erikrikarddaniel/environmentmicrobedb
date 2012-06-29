require 'spec_helper'

describe "subjects/show" do
  before(:each) do
    @subject = assign(:subject, stub_model(Subject))
  end

  it "renders attributes in <p>" do
    render
  end
end
