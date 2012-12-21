# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

<<<<<<< HEAD
ActiveRecord::Schema.define(:version => 20121221121049) do
=======
ActiveRecord::Schema.define(:version => 20121128101237) do
>>>>>>> master

  create_table "amplicons", :force => true do |t|
    t.integer  "sample_id"
    t.integer  "n_specific"
    t.float    "n_unspecific"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "annotation_sources", :force => true do |t|
    t.string   "dbname"
    t.string   "dbversion"
    t.string   "algorithm"
    t.string   "algorithm_parameters"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "cdna_observation_functions", :force => true do |t|
    t.integer  "cdna_observation_id"
    t.integer  "function_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

<<<<<<< HEAD
  create_table "cdna_observation_otus", :force => true do |t|
    t.integer  "cdna_observation_id"
    t.integer  "otu_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "cdna_observation_taxons", :force => true do |t|
    t.integer  "cdna_observation_id"
    t.integer  "taxon_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "cdna_observations", :force => true do |t|
    t.integer  "sample_id"
    t.integer  "n_specific"
    t.float    "n_unspecific"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "annotation_source_id"
  end

  create_table "functions", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "source_db"
    t.string   "rank"
    t.string   "source_identifier"
    t.string   "level0"
    t.string   "level1"
    t.string   "level2"
    t.string   "level3"
    t.string   "level4"
    t.string   "leaf"
  end

  create_table "otus", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
=======
  create_table "otus", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "annotation_source_id"
>>>>>>> master
  end

  create_table "project_properties", :force => true do |t|
    t.string   "name"
    t.string   "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "project_id"
    t.string   "datatype"
  end

  create_table "sample_properties", :force => true do |t|
    t.string   "name"
    t.string   "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "sample_id"
    t.string   "datatype"
  end

  create_table "sample_sets", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "project_id"
    t.string   "name"
  end

  create_table "samples", :force => true do |t|
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "code"
    t.integer  "sample_set_id"
    t.integer  "subject_id"
  end

  add_index "samples", ["subject_id"], :name => "index_samples_on_subject_id"

  create_table "subject_properties", :force => true do |t|
    t.string   "name"
    t.string   "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "subject_id"
    t.string   "datatype"
  end

  create_table "subjects", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "code"
    t.integer  "project_id"
  end

  create_table "taxons", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "source_identifier"
    t.string   "rank"
    t.integer  "parent_id"
    t.string   "source_db"
    t.string   "domain"
    t.string   "kingdom"
    t.string   "phylum"
    t.string   "organism_class"
    t.string   "order"
    t.string   "family"
    t.string   "genus"
    t.string   "species"
  end

end
