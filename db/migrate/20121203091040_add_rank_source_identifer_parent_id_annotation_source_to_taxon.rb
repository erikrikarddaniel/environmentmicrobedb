class AddRankSourceIdentiferParentIdAnnotationSourceToTaxon < ActiveRecord::Migration
  def change
    add_column :taxons, :source_identifier, :string

    add_column :taxons, :rank, :string

    add_column :taxons, :parent_id, :integer

    add_column :taxons, :annotation_source_id, :integer

  end
end
