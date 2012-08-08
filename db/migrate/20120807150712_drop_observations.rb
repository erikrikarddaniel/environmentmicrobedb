class DropObservations < ActiveRecord::Migration
  def change
    drop_table :observations
  end
end
