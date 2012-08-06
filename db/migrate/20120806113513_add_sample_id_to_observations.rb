class AddSampleIdToObservations < ActiveRecord::Migration
  def change
    add_column :observations, :sample_id, :integer
  end
end
