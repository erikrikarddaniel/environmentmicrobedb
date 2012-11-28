require 'spec_helper'

describe "OrfAas" do
  describe "GET /orf_aas" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get orf_aas_path
      response.status.should be(200)
    end
  end
end
