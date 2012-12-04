class CreateCdnaObservations < ActiveRecord::Migration
  def change
    create_table :cdna_observations do |t|
      t.integer :sample_id
      t.integer :n_specific
      t.float :n_unspecific
      t.integer :otu_id
      t.integer :function0_id
      t.integer :function1_id
      t.integer :taxon0_id
      t.integer :taxon1_id

      t.timestamps
    end
  end
end
