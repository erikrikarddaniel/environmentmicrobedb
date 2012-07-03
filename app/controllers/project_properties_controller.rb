class ProjectPropertiesController < ApplicationController
  # GET /project_properties
  # GET /project_properties.json
  def index
    @project_properties = ProjectProperty.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @project_properties }
    end
  end

  # GET /project_properties/1
  # GET /project_properties/1.json
  def show
    @project_property = ProjectProperty.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project_property }
    end
  end

  # GET /project_properties/new
  # GET /project_properties/new.json
  def new
    @project_property = ProjectProperty.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project_property }
    end
  end

  # GET /project_properties/1/edit
  def edit
    @project_property = ProjectProperty.find(params[:id])
  end

  # POST /project_properties
  # POST /project_properties.json
  def create
    @project = Project.find(params[:project_id])
    @project_property = ProjectProperty.new(params[:project_property])
    @project_property.project_id = @project.id
    
    respond_to do |format|
      if @project_property.save
        format.html { redirect_to project_path(@project), notice: 'Project property was successfully created.' }
        format.json { render json: project_path(@project), status: :created, location: @project_property }
      else
        format.html { redirect_to project_path(@project), notice: 'Could not create property'}
        format.json { render json: project_path(@project).errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /project_properties/1
  # PUT /project_properties/1.json
  def update
    @project_property = ProjectProperty.find(params[:id])

    respond_to do |format|
      if @project_property.update_attributes(params[:project_property])
        format.html { redirect_to @project_property, notice: 'Project property was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_properties/1
  # DELETE /project_properties/1.json
  def destroy
    @project_property = ProjectProperty.find(params[:id])
    @project_property.destroy

    respond_to do |format|
      format.html { redirect_to project_properties_url }
      format.json { head :no_content }
    end
  end
end
