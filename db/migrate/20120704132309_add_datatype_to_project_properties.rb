class AddDatatypeToProjectProperties < ActiveRecord::Migration
  def change
		add_column :project_properties, :datatype, :string
  end
end
