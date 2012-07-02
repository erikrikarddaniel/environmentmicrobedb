require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ProjectPropertiesController do

  # This should return the minimal set of attributes required to create a valid
  # ProjectProperty. As you add validations to ProjectProperty, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {name: "proj_prop_name", value: "proj_prop_value"}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ProjectPropertiesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all project_properties as @project_properties" do
      project_property = ProjectProperty.create! valid_attributes
      get :index, {}, valid_session
      assigns(:project_properties).should eq([project_property])
    end
  end

  describe "GET show" do
    it "assigns the requested project_property as @project_property" do
      project_property = ProjectProperty.create! valid_attributes
      get :show, {:id => project_property.to_param}, valid_session
      assigns(:project_property).should eq(project_property)
    end
  end

  describe "GET new" do
    it "assigns a new project_property as @project_property" do
      get :new, {}, valid_session
      assigns(:project_property).should be_a_new(ProjectProperty)
    end
  end

  describe "GET edit" do
    it "assigns the requested project_property as @project_property" do
      project_property = ProjectProperty.create! valid_attributes
      get :edit, {:id => project_property.to_param}, valid_session
      assigns(:project_property).should eq(project_property)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new ProjectProperty" do
        expect {
          post :create, {:project_property => valid_attributes}, valid_session
        }.to change(ProjectProperty, :count).by(1)
      end

      it "assigns a newly created project_property as @project_property" do
        post :create, {:project_property => valid_attributes}, valid_session
        assigns(:project_property).should be_a(ProjectProperty)
        assigns(:project_property).should be_persisted
      end

      it "redirects to the created project_property" do
        post :create, {:project_property => valid_attributes}, valid_session
        response.should redirect_to(ProjectProperty.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved project_property as @project_property" do
        # Trigger the behavior that occurs when invalid params are submitted
        ProjectProperty.any_instance.stub(:save).and_return(false)
        post :create, {:project_property => {}}, valid_session
        assigns(:project_property).should be_a_new(ProjectProperty)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        ProjectProperty.any_instance.stub(:save).and_return(false)
        post :create, {:project_property => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested project_property" do
        project_property = ProjectProperty.create! valid_attributes
        # Assuming there are no other project_properties in the database, this
        # specifies that the ProjectProperty created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        ProjectProperty.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => project_property.to_param, :project_property => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested project_property as @project_property" do
        project_property = ProjectProperty.create! valid_attributes
        put :update, {:id => project_property.to_param, :project_property => valid_attributes}, valid_session
        assigns(:project_property).should eq(project_property)
      end

      it "redirects to the project_property" do
        project_property = ProjectProperty.create! valid_attributes
        put :update, {:id => project_property.to_param, :project_property => valid_attributes}, valid_session
        response.should redirect_to(project_property)
      end
    end

    describe "with invalid params" do
      it "assigns the project_property as @project_property" do
        project_property = ProjectProperty.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ProjectProperty.any_instance.stub(:save).and_return(false)
        put :update, {:id => project_property.to_param, :project_property => {}}, valid_session
        assigns(:project_property).should eq(project_property)
      end

      it "re-renders the 'edit' template" do
        project_property = ProjectProperty.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ProjectProperty.any_instance.stub(:save).and_return(false)
        put :update, {:id => project_property.to_param, :project_property => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested project_property" do
      project_property = ProjectProperty.create! valid_attributes
      expect {
        delete :destroy, {:id => project_property.to_param}, valid_session
      }.to change(ProjectProperty, :count).by(-1)
    end

    it "redirects to the project_properties list" do
      project_property = ProjectProperty.create! valid_attributes
      delete :destroy, {:id => project_property.to_param}, valid_session
      response.should redirect_to(project_properties_url)
    end
  end

end
