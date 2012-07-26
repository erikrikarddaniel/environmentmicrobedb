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
    @sample = Sample.find(@sample_property.sample_id)
  end

  # POST /sample_properties
  # POST /sample_properties.json
  def create
    @sample = Sample.find(params[:sample_id])
    @sample_property = SampleProperty.new(params[:sample_property])
    @sample_property.sample_id = @sample.id
    logger.info("PARAMS SP: #{@sample_property.inspect}")
    respond_to do |format|
      if @sample_property.save
        format.html { redirect_to sample_path(@sample), notice: 'Sample property was successfully created.' }
        format.json { render json: @sample_property, status: :created, location: @sample_property }
      else
        flash[:error] = "Sample property was not created: #{@sample_property.errors.messages[:error][0]}."
        format.html { redirect_to sample_path(@sample) }
        format.json { render json: @sample_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sample_properties/1
  # PUT /sample_properties/1.json
  def update
    @sample_property = SampleProperty.find(params[:id])
    @sample = Sample.find(@sample_property.sample_id)
    respond_to do |format|
      if @sample_property.update_attributes(params[:sample_property])
        format.html { redirect_to sample_path(@sample), notice: 'Sample property was successfully updated.' }
        format.json { head :no_content }
      else
        flash[:error] = "Property was not Updated: #{@sample_property.errors.messages[:error][0]}."
        format.html { redirect_to sample_property_path(@sample_property) }
        format.json { render json: @sample_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sample_properties/1
  # DELETE /sample_properties/1.json
  def destroy
    @sample_property = SampleProperty.find(params[:id])
    @sample = Sample.find(@sample_property.sample_id)
    @sample_property.destroy

    respond_to do |format|
      format.html { redirect_to edit_sample_path(@sample) }
      format.json { head :no_content }
    end
  end
end
