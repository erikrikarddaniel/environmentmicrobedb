class SubjectsController < ApplicationController
  # GET /subjects
  # GET /subjects.json
  def index
    @subjects = Subject.where(project_id: params[:project_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subjects }
    end
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
    @subject = Subject.find(params[:id])
    @subject_property = @subject.properties.build
    @subject_properties = @subject.properties.all
    if (not params[:sample_id].nil?)
      @sample = Sample.find(params[:sample_id])
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subject }
    end
  end

  # GET /subjects/new
  # GET /subjects/new.json
  def new
    @subject = Subject.new()
    @subject.project_id = params[:project_id]
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subject }
    end
  end

  # GET /subjects/1/edit
  def edit
    @subject = Subject.find(params[:id])
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = Subject.new(params[:subject])
    if (not params[:sample_id].nil?)
      @sample = Sample.find(params[:sample_id])
    end
    respond_to do |format|
      if @subject.save
        if (not params[:sample_id].nil?)
          format.html { redirect_to project_sample_set_sample_path(params[:project_id],params[:sample_set_id], params[:sample_id]), notice: 'Subject was successfully created.' }
        else
          format.html { redirect_to project_subjects_path(params[:project_id]), notice: 'Subject was successfully created.' }
        end
        format.json { render json: @subject, status: :created, location: @subject }
      else
        format.html { render action: "new" }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /subjects/1
  # PUT /subjects/1.json
  def update
    @subject = Subject.find(params[:id])
    respond_to do |format|
      if @subject.update_attributes(params[:subject])
        if (not params[:sample_id].nil?)
          format.html { redirect_to project_sample_set_sample_subject_path(params[:project_id],params[:sample_set_id], params[:sample_id],@subject), notice: 'Subject was successfully updated.' }
        else
          format.html { redirect_to project_subject_path(params[:project_id],@subject), notice: 'Subject was successfully updated.' }
        end
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy

    respond_to do |format|
      if (not params[:sample_id].nil?)
          format.html { redirect_to project_sample_set_sample_path(params[:project_id],params[:sample_set_id], params[:sample_id]), notice: 'Subject was successfully deleted.' }
        else
          format.html { redirect_to project_subjects_path(params[:project_id]), notice: 'Subject was successfully deleted.' }
        end
      format.json { head :no_content }
    end
  end

end
