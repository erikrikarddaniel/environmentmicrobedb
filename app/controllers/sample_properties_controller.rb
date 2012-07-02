class SamplePropertiesController < ApplicationController
  # GET /sample_properties
  # GET /sample_properties.json
  def index
    @sample_properties = SampleProperty.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sample_properties }
    end
  end

  # GET /sample_properties/1
  # GET /sample_properties/1.json
  def show
    @sample_property = SampleProperty.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sample_property }
    end
  end

  # GET /sample_properties/new
  # GET /sample_properties/new.json
  def new
    @sample_property = SampleProperty.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sample_property }
    end
  end

  # GET /sample_properties/1/edit
  def edit
    @sample_property = SampleProperty.find(params[:id])
  end

  # POST /sample_properties
  # POST /sample_properties.json
  def create
    @sample_property = SampleProperty.new(params[:sample_property])

    respond_to do |format|
      if @sample_property.save
        format.html { redirect_to @sample_property, notice: 'Sample property was successfully created.' }
        format.json { render json: @sample_property, status: :created, location: @sample_property }
      else
        format.html { render action: "new" }
        format.json { render json: @sample_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sample_properties/1
  # PUT /sample_properties/1.json
  def update
    @sample_property = SampleProperty.find(params[:id])

    respond_to do |format|
      if @sample_property.update_attributes(params[:sample_property])
        format.html { redirect_to @sample_property, notice: 'Sample property was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sample_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sample_properties/1
  # DELETE /sample_properties/1.json
  def destroy
    @sample_property = SampleProperty.find(params[:id])
    @sample_property.destroy

    respond_to do |format|
      format.html { redirect_to sample_properties_url }
      format.json { head :no_content }
    end
  end
end
