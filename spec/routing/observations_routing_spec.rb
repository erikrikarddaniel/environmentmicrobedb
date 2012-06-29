require "spec_helper"

describe ObservationsController do
  describe "routing" do

    it "routes to #index" do
      get("/observations").should route_to("observations#index")
    end

    it "routes to #new" do
      get("/observations/new").should route_to("observations#new")
    end

    it "routes to #show" do
      get("/observations/1").should route_to("observations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/observations/1/edit").should route_to("observations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/observations").should route_to("observations#create")
    end

    it "routes to #update" do
      put("/observations/1").should route_to("observations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/observations/1").should route_to("observations#destroy", :id => "1")
    end

  end
end
