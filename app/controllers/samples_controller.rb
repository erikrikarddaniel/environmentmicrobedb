class SamplesController < ApplicationController
  # GET /samples
  # GET /samples.json
  def index
    @samples = Sample.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @samples }
    end
  end

  # GET /samples/1
  # GET /samples/1.json
  def show
    @sample = Sample.find(params[:id])
    @sample_set = SampleSet.find(@sample.sample_set_id)
    @project = Project.find(@sample_set.project_id)
    @sample_properties = @sample.properties
    @subjects = Subject.where(project_id: @project.id).select(:code).map(&:code)
    if not @sample.subject_id.nil?
      @subject = Subject.find(@sample.subject_id)
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sample }
    end
  end

  # GET /samples/new
  # GET /samples/new.json
  def new
    @sample_set = SampleSet.find(params[:ss_id])
    @project = Project.find(@sample_set.project_id)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sample }
    end
  end

  # GET /samples/1/edit
  def edit
    @sample = Sample.find(params[:id])
    @sample_set = SampleSet.find(@sample.sample_set_id)
    @project = Project.find(@sample_set.project_id)
    @sample_properties = @sample.properties
    
  end

  # POST /samples
  # POST /samples.json
  def create
    @sample_set = SampleSet.find(params[:sample_set_id])
    @sample = Sample.new(params[:sample])
    @sample.sample_set_id = @sample_set.id
    respond_to do |format|
      if @sample.save
        format.html { redirect_to sample_path(@sample), notice: 'Sample was successfully created.' }
        format.json { render json: @sample, status: :created, location: @sample }
      else
        format.html { render action: "new", notice: 'Sample was not created.' }
        format.json { render json: @sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /samples/1
  # PUT /samples/1.json
  def update
    @sample = Sample.find(params[:id])
    @sample_set = SampleSet.find(@sample.sample_set_id)
    
    respond_to do |format|
      if @sample.update_attributes(params[:sample])
        format.html { redirect_to sample_path(@sample), notice: 'Sample was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /samples/1
  # DELETE /samples/1.json
  def destroy
    @sample = Sample.find(params[:id])
    @sample_set = SampleSet.find(@sample.sample_set_id)
    @sample.destroy
    
    respond_to do |format|
      format.html { redirect_to project_path(@sample_set.project_id) }
      format.json { head :no_content }
    end
  end
end
