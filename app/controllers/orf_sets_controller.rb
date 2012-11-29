class OrfSetsController < ApplicationController
  # GET /orf_sets
  # GET /orf_sets.json
  def index
    @orf_sets = OrfSet.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orf_sets }
    end
  end

  # GET /orf_sets/1
  # GET /orf_sets/1.json
  def show
    @orf_set = OrfSet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @orf_set }
    end
  end

  # GET /orf_sets/new
  # GET /orf_sets/new.json
  def new
    @orf_set = OrfSet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @orf_set }
    end
  end

  # GET /orf_sets/1/edit
  def edit
    @orf_set = OrfSet.find(params[:id])
  end

  # POST /orf_sets
  # POST /orf_sets.json
  def create
    assembly_id = params[:orf_set].delete(:assembly_id)
    @orf_set = Assembly.find(assembly_id).orf_sets.new(params[:orf_set])

    respond_to do |format|
      if @orf_set.save
        format.html { redirect_to @orf_set, notice: 'Orf set was successfully created.' }
        format.json { render json: @orf_set, status: :created, location: @orf_set }
      else
        format.html { render action: "new" }
        format.json { render json: @orf_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orf_sets/1
  # PUT /orf_sets/1.json
  def update
    assembly_id = params[:orf_set].delete(:assembly_id)
    @orf_set = OrfSet.find(params[:id])

    respond_to do |format|
      if @orf_set.update_attributes(params[:orf_set])
        format.html { redirect_to @orf_set, notice: 'Orf set was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @orf_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orf_sets/1
  # DELETE /orf_sets/1.json
  def destroy
    @orf_set = OrfSet.find(params[:id])
    @orf_set.destroy

    respond_to do |format|
      format.html { redirect_to orf_sets_url }
      format.json { head :no_content }
    end
  end
end
