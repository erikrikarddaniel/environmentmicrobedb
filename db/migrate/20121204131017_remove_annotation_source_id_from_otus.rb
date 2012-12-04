class RemoveAnnotationSourceIdFromOtus < ActiveRecord::Migration
  def up
    remove_column :otus, :annotation_source_id
      end

  def down
    add_column :otus, :annotation_source_id, :integer
  end
end
