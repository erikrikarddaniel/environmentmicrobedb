class AddSourceDbToTaxon < ActiveRecord::Migration
  def change
    add_column :taxons, :source_db, :string

  end
end
