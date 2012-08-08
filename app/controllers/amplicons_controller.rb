class AmpliconsController < ApplicationController
  # GET /amplicons
  # GET /amplicons.json
  def index
    @amplicons = Amplicon.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @amplicons }
    end
  end

  # GET /amplicons/1
  # GET /amplicons/1.json
  def show
    @amplicon = Amplicon.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @amplicon }
    end
  end

  # GET /amplicons/new
  # GET /amplicons/new.json
  def new
    @amplicon = Amplicon.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @amplicon }
    end
  end

  # GET /amplicons/1/edit
  def edit
    @amplicon = Amplicon.find(params[:id])
  end

  # POST /amplicons
  # POST /amplicons.json
  def create
    @amplicon = Amplicon.new(params[:amplicon])

    respond_to do |format|
      if @amplicon.save
        format.html { redirect_to @amplicon, notice: 'Amplicon was successfully created.' }
        format.json { render json: @amplicon, status: :created, location: @amplicon }
      else
        format.html { render action: "new" }
        format.json { render json: @amplicon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /amplicons/1
  # PUT /amplicons/1.json
  def update
    @amplicon = Amplicon.find(params[:id])

    respond_to do |format|
      if @amplicon.update_attributes(params[:amplicon])
        format.html { redirect_to @amplicon, notice: 'Amplicon was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @amplicon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /amplicons/1
  # DELETE /amplicons/1.json
  def destroy
    @amplicon = Amplicon.find(params[:id])
    @amplicon.destroy

    respond_to do |format|
      format.html { redirect_to amplicons_url }
      format.json { head :no_content }
    end
  end
end
