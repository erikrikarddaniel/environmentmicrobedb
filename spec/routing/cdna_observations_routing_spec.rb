require "spec_helper"

describe CdnaObservationsController do
  describe "routing" do

    it "routes to #index" do
      get("/cdna_observations").should route_to("cdna_observations#index")
    end

    it "routes to #new" do
      get("/cdna_observations/new").should route_to("cdna_observations#new")
    end

    it "routes to #show" do
      get("/cdna_observations/1").should route_to("cdna_observations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/cdna_observations/1/edit").should route_to("cdna_observations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/cdna_observations").should route_to("cdna_observations#create")
    end

    it "routes to #update" do
      put("/cdna_observations/1").should route_to("cdna_observations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/cdna_observations/1").should route_to("cdna_observations#destroy", :id => "1")
    end

  end
end
