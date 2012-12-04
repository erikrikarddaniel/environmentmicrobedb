class CreateCdnaObservations < ActiveRecord::Migration
  def change
    create_table :cdna_observations do |t|
      t.integer :sample_id
      t.integer :n_specific
      t.float :n_unspecific

      t.timestamps
    end
  end
end
