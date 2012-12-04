class CreateCdnaObservationFunctions < ActiveRecord::Migration
  def change
    create_table :cdna_observation_functions do |t|
      t.integer :cdna_observation_id
      t.integer :function_id

      t.timestamps
    end
  end
end
