class ProjectpropertyChangeId < ActiveRecord::Migration
  def change
    remove_column :project_properties, :project_id
    add_column :project_properties, :project_id, :integer
  end
  def self.down
    remove_column :project_properties, :project_id
    add_column :project_properties, :project_id, :string
  end
end