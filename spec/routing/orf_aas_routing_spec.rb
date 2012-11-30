require "spec_helper"

describe OrfAasController do
  describe "routing" do

    it "routes to #index" do
      get("/orf_aas").should route_to("orf_aas#index")
    end

    it "routes to #new" do
      get("/orf_aas/new").should route_to("orf_aas#new")
    end

    it "routes to #show" do
      get("/orf_aas/1").should route_to("orf_aas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/orf_aas/1/edit").should route_to("orf_aas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/orf_aas").should route_to("orf_aas#create")
    end

    it "routes to #update" do
      put("/orf_aas/1").should route_to("orf_aas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/orf_aas/1").should route_to("orf_aas#destroy", :id => "1")
    end

  end
end
