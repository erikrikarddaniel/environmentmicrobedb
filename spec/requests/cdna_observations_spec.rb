require 'spec_helper'

describe "CdnaObservations" do
  describe "GET /cdna_observations" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get cdna_observations_path
      response.status.should be(200)
    end
  end
end
