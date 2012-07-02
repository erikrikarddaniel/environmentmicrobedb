require "spec_helper"

describe SubjectPropertiesController do
  describe "routing" do

    it "routes to #index" do
      get("/subject_properties").should route_to("subject_properties#index")
    end

    it "routes to #new" do
      get("/subject_properties/new").should route_to("subject_properties#new")
    end

    it "routes to #show" do
      get("/subject_properties/1").should route_to("subject_properties#show", :id => "1")
    end

    it "routes to #edit" do
      get("/subject_properties/1/edit").should route_to("subject_properties#edit", :id => "1")
    end

    it "routes to #create" do
      post("/subject_properties").should route_to("subject_properties#create")
    end

    it "routes to #update" do
      put("/subject_properties/1").should route_to("subject_properties#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/subject_properties/1").should route_to("subject_properties#destroy", :id => "1")
    end

  end
end
