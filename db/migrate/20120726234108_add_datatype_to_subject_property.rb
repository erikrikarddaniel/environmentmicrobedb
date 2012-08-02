class AddDatatypeToSubjectProperty < ActiveRecord::Migration
  def change
    add_column :subject_properties, :datatype, :string
  end
end
