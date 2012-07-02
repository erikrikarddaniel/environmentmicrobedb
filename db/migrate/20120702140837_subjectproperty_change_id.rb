class SubjectpropertyChangeId < ActiveRecord::Migration
  def self.up
    remove_column :subject_properties, :sample_id
    add_column :subject_properties, :subject_id, :integer
  end
  def self.down
    remove_column :subject_properties, :subject_id
    add_column :subject_properties, :subject_id, :string
  end
end
