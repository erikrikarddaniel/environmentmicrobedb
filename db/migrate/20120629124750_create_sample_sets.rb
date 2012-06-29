class CreateSampleSets < ActiveRecord::Migration
  def change
    create_table :sample_sets do |t|

      t.timestamps
    end
  end
end
