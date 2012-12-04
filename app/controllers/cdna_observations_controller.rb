class CdnaObservationsController < ApplicationController
  # GET /cdna_observations
  # GET /cdna_observations.json
  def index
    @cdna_observations = CdnaObservation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cdna_observations }
    end
  end

  # GET /cdna_observations/1
  # GET /cdna_observations/1.json
  def show
    @cdna_observation = CdnaObservation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cdna_observation }
    end
  end

  # GET /cdna_observations/new
  # GET /cdna_observations/new.json
  def new
    @cdna_observation = CdnaObservation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cdna_observation }
    end
  end

  # GET /cdna_observations/1/edit
  def edit
    @cdna_observation = CdnaObservation.find(params[:id])
  end

  # POST /cdna_observations
  # POST /cdna_observations.json
  def create
    @cdna_observation = CdnaObservation.new(params[:cdna_observation])

    respond_to do |format|
      if @cdna_observation.save
        format.html { redirect_to @cdna_observation, notice: 'Cdna observation was successfully created.' }
        format.json { render json: @cdna_observation, status: :created, location: @cdna_observation }
      else
        format.html { render action: "new" }
        format.json { render json: @cdna_observation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cdna_observations/1
  # PUT /cdna_observations/1.json
  def update
    @cdna_observation = CdnaObservation.find(params[:id])

    respond_to do |format|
      if @cdna_observation.update_attributes(params[:cdna_observation])
        format.html { redirect_to @cdna_observation, notice: 'Cdna observation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cdna_observation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cdna_observations/1
  # DELETE /cdna_observations/1.json
  def destroy
    @cdna_observation = CdnaObservation.find(params[:id])
    @cdna_observation.destroy

    respond_to do |format|
      format.html { redirect_to cdna_observations_url }
      format.json { head :no_content }
    end
  end
end
