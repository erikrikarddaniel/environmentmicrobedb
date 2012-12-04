class RemoveAnnotationSourceIdFromFunctions < ActiveRecord::Migration
  def up
    remove_column :functions, :annotation_source_id
      end

  def down
    add_column :functions, :annotation_source_id, :integer
  end
end
