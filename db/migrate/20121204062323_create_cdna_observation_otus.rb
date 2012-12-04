class CreateCdnaObservationOtus < ActiveRecord::Migration
  def change
    create_table :cdna_observation_otus do |t|
      t.integer :cdna_observation_id
      t.integer :otu_id

      t.timestamps
    end
  end
end
