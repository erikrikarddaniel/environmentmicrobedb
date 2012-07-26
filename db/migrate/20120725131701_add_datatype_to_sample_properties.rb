class AddDatatypeToSampleProperties < ActiveRecord::Migration
  def change
    add_column :sample_properties, :datatype, :string
  end
end
