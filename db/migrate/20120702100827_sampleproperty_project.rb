class SamplepropertyProject < ActiveRecord::Migration
  def self.up
    add_column :sample_properties, :sample_set_id, :string
  end
 
  def self.down
    remove_column :sample_properties, :sample_set_id
  end
end