class AddAnnotationSourceIdToOtus < ActiveRecord::Migration
  def change
    add_column :otus, :annotation_source_id, :integer
  end
end
