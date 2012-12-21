class AddAnnotationSourceIdToCdnaObservation < ActiveRecord::Migration
  def change
    add_column :cdna_observations, :annotation_source_id, :integer

  end
end
