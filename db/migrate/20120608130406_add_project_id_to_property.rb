class FixColumnName < ActiveRecord::Migration
  def self.up
    rename_column :properties, :project_id, :projects_id
  end

  def self.down
    # rename back if you need or do something else or do nothing
  end
end
