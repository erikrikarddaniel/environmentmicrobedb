require 'spec_helper'

describe "Static pages" do
  describe "Home" do
    it "has a home page" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get root_path
      response.status.should be(200)
    end
  end
    describe "About" do
    it "has an about page" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get about_path
      response.status.should be(200)
    end
  end
    describe "Help" do
    it "has a help page" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get help_path
      response.status.should be(200)
    end
  end
end
