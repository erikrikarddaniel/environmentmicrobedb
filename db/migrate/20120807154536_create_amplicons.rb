class CreateAmplicons < ActiveRecord::Migration
  def change
    create_table :amplicons do |t|
      t.integer :sample_id
      t.integer :n_specific
      t.float :n_unspecific, :limit => 53

      t.timestamps
    end
  end
end
