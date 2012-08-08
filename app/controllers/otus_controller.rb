class OtusController < ApplicationController
  # GET /otus
  # GET /otus.json
  def index
    @otus = Otu.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @otus }
    end
  end

  # GET /otus/1
  # GET /otus/1.json
  def show
    @otu = Otu.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @otu }
    end
  end

  # GET /otus/new
  # GET /otus/new.json
  def new
    @otu = Otu.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @otu }
    end
  end

  # GET /otus/1/edit
  def edit
    @otu = Otu.find(params[:id])
  end

  # POST /otus
  # POST /otus.json
  def create
    @otu = Otu.new(params[:otu])

    respond_to do |format|
      if @otu.save
        format.html { redirect_to @otu, notice: 'Otu was successfully created.' }
        format.json { render json: @otu, status: :created, location: @otu }
      else
        format.html { render action: "new" }
        format.json { render json: @otu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /otus/1
  # PUT /otus/1.json
  def update
    @otu = Otu.find(params[:id])

    respond_to do |format|
      if @otu.update_attributes(params[:otu])
        format.html { redirect_to @otu, notice: 'Otu was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @otu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /otus/1
  # DELETE /otus/1.json
  def destroy
    @otu = Otu.find(params[:id])
    @otu.destroy

    respond_to do |format|
      format.html { redirect_to otus_url }
      format.json { head :no_content }
    end
  end
end
