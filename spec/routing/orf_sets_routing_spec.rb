require "spec_helper"

describe OrfSetsController do
  describe "routing" do

    it "routes to #index" do
      get("/orf_sets").should route_to("orf_sets#index")
    end

    it "routes to #new" do
      get("/orf_sets/new").should route_to("orf_sets#new")
    end

    it "routes to #show" do
      get("/orf_sets/1").should route_to("orf_sets#show", :id => "1")
    end

    it "routes to #edit" do
      get("/orf_sets/1/edit").should route_to("orf_sets#edit", :id => "1")
    end

    it "routes to #create" do
      post("/orf_sets").should route_to("orf_sets#create")
    end

    it "routes to #update" do
      put("/orf_sets/1").should route_to("orf_sets#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/orf_sets/1").should route_to("orf_sets#destroy", :id => "1")
    end

  end
end
