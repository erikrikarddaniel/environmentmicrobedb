class AddHierarchyToTaxon < ActiveRecord::Migration
  def change
    add_column :taxons, :domain, :string

    add_column :taxons, :kingdom, :string

    add_column :taxons, :phylum, :string

    add_column :taxons, :organism_class, :string

    add_column :taxons, :order, :string

    add_column :taxons, :family, :string

    add_column :taxons, :genus, :string

    add_column :taxons, :species, :string

  end
end
