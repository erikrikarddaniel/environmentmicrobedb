class AddSampleSetIdOnSamples < ActiveRecord::Migration
  def change
    add_column :samples, :sample_set_id, :integer
  end 
end
