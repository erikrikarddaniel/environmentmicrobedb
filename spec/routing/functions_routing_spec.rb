require "spec_helper"

describe FunctionsController do
  describe "routing" do

    it "routes to #index" do
      get("/functions").should route_to("functions#index")
    end

    it "routes to #new" do
      get("/functions/new").should route_to("functions#new")
    end

    it "routes to #show" do
      get("/functions/1").should route_to("functions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/functions/1/edit").should route_to("functions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/functions").should route_to("functions#create")
    end

    it "routes to #update" do
      put("/functions/1").should route_to("functions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/functions/1").should route_to("functions#destroy", :id => "1")
    end

  end
end
