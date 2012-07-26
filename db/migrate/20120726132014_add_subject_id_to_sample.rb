class AddSubjectIdToSample < ActiveRecord::Migration
  def change
    add_column :samples, :subject_id, :integer
    add_index :samples, :subject_id
  end
end
