class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
    @project = Project.new
    @project.properties.build
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
    @project_property = @project.properties.build
    @project_properties = @project.properties.all
    @sample_set = @project.sample_sets[0]
    @sample = @sample_set.samples.build
    @samples = Sample.where(sample_set_id: @sample_set.id)
    
    @project_properties.sort! { |a,b| 
      comp = (a.name.downcase <=> b.name.downcase)
      comp.zero? ? (a.value.downcase <=> b.value.downcase) :comp }

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new
    @project.properties.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
    @project_properties = @project.properties
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])
    respond_to do |format|
      if @project.save
        
        @project.sample_sets.create(name: "Set 1")
        
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end 
  
  def upload
    
    @project = Project.find(params[:project_id])
    @sample_sets = SampleSet.where(project_id: @project.id)

    respond_to do |format|
      format.html
      format.json { head :no_content }
    end
  end
  
  def file_upload
###############################################################
#    # algorithm: CD-HIT:ssaha2
#    # dbname: Silva
#    # dbversion: 108Ref
#    #
#    # sample  algorithm_parameters  OTU n_specific  n_unspecific
#    map2otucounts.00.sample00 97  OTU97_000 1 1.0
#    map2otucounts.00.sample00 98  OTU98_000 1 1.0
#    map2otucounts.00.sample00 99  OTU99_000 1 1.0
#    map2otucounts.00.sample02 97  OTU97_000 6 6.0
#    map2otucounts.00.sample02 98  OTU98_000 5 5.5
#    map2otucounts.00.sample02 98  OTU98_001 0 0.5
#    map2otucounts.00.sample02 99  OTU99_000 5 5.25
#    map2otucounts.00.sample02 99  OTU99_001 0 0.25
#    map2otucounts.00.sample02 99  OTU99_002 0 0.25
#    map2otucounts.00.sample02 99  OTU99_003 0 0.25
###############################################################
    require 'fileutils'
    properties = {}
    alg_params = {}
    samples = {}
    counts = []
    File.open("#{params[:file_upload][:my_file].path}", "r").each_with_index do |line,index|
      if (line[0] != "#" && line.split.length > 0)
        counts.append(line.split())
        #create a dictionary of sets with algorithm_parameter as key, otus as values of set
        if (alg_params.has_key?(counts.last[1]))
          alg_params[counts.last[1]].add(counts.last[2])
        else
          alg_params[counts.last[1]] = Set.new([counts.last[2]])
        end
        #add samples codes
        if (samples.has_key?(counts.last[0]))
          samples[counts.last[0]].add(counts.last[2])
        else
          samples[counts.last[0]] = Set.new([[count.last[2..4]]])
        end
      elsif (line[0] == "#" && index < 3)
        #process the properties, add them as symbols to an dictionary, used for lookup and creation of annotation source.
        prop = line.split[1,2]
        properties["#{prop[0].sub(":","")}".to_sym] = prop[1]
      end
    end
    FileUtils.rm params[:file_upload][:my_file].tempfile
        
    #Create annotation source and otus for each annotation source. If exists, do nothing.
    alg_params.each do |p|
      @annotation_source = AnnotationSource.where(dbname: properties[:dbname], dbversion: properties[:dbversion], algorithm: properties[:algorithm], algorithm_parameters: p[0]).first
      if (@annotation_source.nil?)
        @annotation_source = AnnotationSource.create(dbname: properties[:dbname], dbversion: properties[:dbversion], algorithm: properties[:algorithm], algorithm_parameters: p[0])
      end
      p[1].each do |o|
        @otu = Otu.where(name: o, annotation_source_id: @annotation_source.id).first
        if (@otu.nil?)
          @otu = Otu.create(name: o, annotation_source_id: @annotation_source.id)
        end    
      end
    end

    #If sample does not exists, create
    @project = Project.find(params[:project_id])
    @sample_set = @project.sample_sets.first
    
    samples.each do |s|
      @sample = @sample_set.samples.where(code: s[0]).first
      if (@sample.nil?)
        @sample = @sample_set.samples.create(code: s[0])
      end
      @sample.amplicons.delete_all
      
      s[1].each do |parameters|
        
        @sample.amplicons.create(n_specific: parameters[1])
      end
    end

    redirect_to project_path(params[:project_id])
  end
end
