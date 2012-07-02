class SubjectpropertyProject < ActiveRecord::Migration
  def self.up
    add_column :subject_properties, :sample_id, :string
  end
 
  def self.down
    remove_column :subject_properties, :sample_id
  end
end
