class SubjectPropertiesController < ApplicationController
  # GET /subject_properties
  # GET /subject_properties.json
  def index
    @subject_properties = SubjectProperty.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subject_properties }
    end
  end

  # GET /subject_properties/1
  # GET /subject_properties/1.json
  def show
    @subject_property = SubjectProperty.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subject_property }
    end
  end

  # GET /subject_properties/new
  # GET /subject_properties/new.json
  def new
    @subject_property = SubjectProperty.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subject_property }
    end
  end

  # GET /subject_properties/1/edit
  def edit
    @subject_property = SubjectProperty.find(params[:id])
    @subject = Subject.find(@subject_property.subject_id)
  end

  # POST /subject_properties
  # POST /subject_properties.json
  def create
    
    @subject = Subject.find(params[:subject_id])
    @subject_property = SubjectProperty.new(params[:subject_property])
    @subject_property.subject_id = @subject.id

    respond_to do |format|
      if @subject_property.save
        format.html { redirect_to project_sample_set_sample_subject_path(params[:project_id],params[:sample_set_id],params[:sample_id],@subject), notice: 'Subject property was successfully created.' }
        format.json { render json: @subject_property, status: :created, location: @subject_property }
      else
        flash[:error] = "Subject property was not created: #{@subject_property.errors.messages[:error][0]}."
        format.html { redirect_to project_sample_set_sample_subject_path(params[:project_id],params[:sample_set_id],params[:sample_id],@subject) }
        format.json { render json: @subject_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /subject_properties/1
  # PUT /subject_properties/1.json
  def update
    @subject_property = SubjectProperty.find(params[:id])
    @subject = Subject.find(@subject_property.subject_id)
    respond_to do |format|
      if @subject_property.update_attributes(params[:subject_property])
        format.html { redirect_to project_sample_set_sample_subject_path(params[:project_id],params[:sample_set_id],params[:sample_id],@subject), notice: 'Subject property was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subject_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subject_properties/1
  # DELETE /subject_properties/1.json
  def destroy
    @subject_property = SubjectProperty.find(params[:id])
    @subject = Subject.find(@subject_property.subject_id)
    @subject_property.destroy

    respond_to do |format|
      format.html { redirect_to project_sample_set_sample_subject_path(params[:project_id],params[:sample_set_id],params[:sample_id],@subject) }
      format.json { head :no_content }
    end
  end
end
