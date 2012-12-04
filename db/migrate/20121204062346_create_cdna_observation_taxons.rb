class CreateCdnaObservationTaxons < ActiveRecord::Migration
  def change
    create_table :cdna_observation_taxons do |t|
      t.integer :cdna_observation_id
      t.integer :taxon_id

      t.timestamps
    end
  end
end
