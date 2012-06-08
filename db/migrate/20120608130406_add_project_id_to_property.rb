class AddProjectIdToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :project_id, :integer

  end
end
