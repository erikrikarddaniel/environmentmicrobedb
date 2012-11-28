require 'file_parsers'
include FileParsers

class OrfAasController < ApplicationController
  # GET /orf_aas
  # GET /orf_aas.json
  def index
    @orf_aas = OrfAa.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orf_aas }
    end
  end

  # GET /orf_aas/1
  # GET /orf_aas/1.json
  def show
    @orf_aa = OrfAa.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @orf_aa }
    end
  end

  # GET /orf_aas/new
  # GET /orf_aas/new.json
  def new
    @orf_aa = OrfAa.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @orf_aa }
    end
  end

  # GET /orf_aas/1/edit
  def edit
    @orf_aa = OrfAa.find(params[:id])
  end

  # POST /orf_aas
  # POST /orf_aas.json
  def create
    # Squirrel away the file parameter to avoid problems when creating the result object
    file = params[:orf_aa].delete(:file)

    respond_to do |format|
      if file
	@assembly = Assembly.find(params[:orf_aa][:assembly_id])
	n_imported = import_frag_gene_scan(@assembly, file)
        format.html { redirect_to @assembly, notice: "Imported #{n_imported} FragGeneScan ORFs." }
        format.json { render json: @assembly, status: :created }
      else
        format.html { render action: "new", notice: "You must provide a file name" }
        format.json { render json: @orf_aa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orf_aas/1
  # PUT /orf_aas/1.json
  def update
    @orf_aa = OrfAa.find(params[:id])

    respond_to do |format|
      if @orf_aa.update_attributes(params[:orf_aa])
        format.html { redirect_to @orf_aa, notice: 'Orf aa was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @orf_aa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orf_aas/1
  # DELETE /orf_aas/1.json
  def destroy
    @orf_aa = OrfAa.find(params[:id])
    @orf_aa.destroy

    respond_to do |format|
      format.html { redirect_to orf_aas_url }
      format.json { head :no_content }
    end
  end
end
