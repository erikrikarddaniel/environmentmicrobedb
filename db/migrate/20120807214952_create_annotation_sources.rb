class CreateAnnotationSources < ActiveRecord::Migration
  def change
    create_table :annotation_sources do |t|
      t.string :dbname
      t.string :dbversion
      t.string :algorithm
      t.string :algorithm_parameters
      
      t.timestamps
    end
  end
end
