class SamplepropertyChangeId < ActiveRecord::Migration
  def change
    remove_column :sample_properties, :sample_set_id
    add_column :sample_properties, :sample_id, :integer
  end
  def self.down
    remove_column :sample_properties, :sample_id
    add_column :sample_properties, :sample_id, :string
  end
end