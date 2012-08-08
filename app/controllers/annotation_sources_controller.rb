class AnnotationSourcesController < ApplicationController
  # GET /annotation_sources
  # GET /annotation_sources.json
  def index
    @annotation_sources = AnnotationSource.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @annotation_sources }
    end
  end

  # GET /annotation_sources/1
  # GET /annotation_sources/1.json
  def show
    @annotation_source = AnnotationSource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @annotation_source }
    end
  end

  # GET /annotation_sources/new
  # GET /annotation_sources/new.json
  def new
    @annotation_source = AnnotationSource.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @annotation_source }
    end
  end

  # GET /annotation_sources/1/edit
  def edit
    @annotation_source = AnnotationSource.find(params[:id])
  end

  # POST /annotation_sources
  # POST /annotation_sources.json
  def create
    @annotation_source = AnnotationSource.new(params[:annotation_source])

    respond_to do |format|
      if @annotation_source.save
        format.html { redirect_to @annotation_source, notice: 'Annotation source was successfully created.' }
        format.json { render json: @annotation_source, status: :created, location: @annotation_source }
      else
        format.html { render action: "new" }
        format.json { render json: @annotation_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /annotation_sources/1
  # PUT /annotation_sources/1.json
  def update
    @annotation_source = AnnotationSource.find(params[:id])

    respond_to do |format|
      if @annotation_source.update_attributes(params[:annotation_source])
        format.html { redirect_to @annotation_source, notice: 'Annotation source was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @annotation_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /annotation_sources/1
  # DELETE /annotation_sources/1.json
  def destroy
    @annotation_source = AnnotationSource.find(params[:id])
    @annotation_source.destroy

    respond_to do |format|
      format.html { redirect_to annotation_sources_url }
      format.json { head :no_content }
    end
  end
end
