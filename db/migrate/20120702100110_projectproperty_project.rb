class ProjectpropertyProject < ActiveRecord::Migration
  def self.up
    add_column :project_properties, :project_id, :string
  end
 
  def self.down
    remove_column :project_properties, :project_id
  end
end