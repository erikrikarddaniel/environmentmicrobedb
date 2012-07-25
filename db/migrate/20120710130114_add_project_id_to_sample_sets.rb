class AddProjectIdToSampleSets < ActiveRecord::Migration
  def change
		add_column :sample_sets, :project_id, :integer
  end
end
