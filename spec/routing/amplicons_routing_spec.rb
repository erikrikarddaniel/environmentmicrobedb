require "spec_helper"

describe AmpliconsController do
  describe "routing" do

    it "routes to #index" do
      get("/amplicons").should route_to("amplicons#index")
    end

    it "routes to #new" do
      get("/amplicons/new").should route_to("amplicons#new")
    end

    it "routes to #show" do
      get("/amplicons/1").should route_to("amplicons#show", :id => "1")
    end

    it "routes to #edit" do
      get("/amplicons/1/edit").should route_to("amplicons#edit", :id => "1")
    end

    it "routes to #create" do
      post("/amplicons").should route_to("amplicons#create")
    end

    it "routes to #update" do
      put("/amplicons/1").should route_to("amplicons#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/amplicons/1").should route_to("amplicons#destroy", :id => "1")
    end

  end
end
