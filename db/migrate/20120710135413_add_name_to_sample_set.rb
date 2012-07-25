class AddNameToSampleSet < ActiveRecord::Migration
  def change
    add_column :sample_sets, :name, :string
  end
end
