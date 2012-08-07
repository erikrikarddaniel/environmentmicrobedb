class AddObservationTypeToObservations < ActiveRecord::Migration
  def change
    add_column :observations, :observation_type, :string
  end
end
