class RemoveAnnotationSourceIdFromTaxons < ActiveRecord::Migration
  def up
    remove_column :taxons, :annotation_source_id
      end

  def down
    add_column :taxons, :annotation_source_id, :integer
  end
end
