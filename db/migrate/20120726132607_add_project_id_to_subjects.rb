class AddProjectIdToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :project_id, :integer
  end
end
