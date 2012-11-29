class CreateOrfSets < ActiveRecord::Migration
  def change
    create_table :orf_sets do |t|
      t.string :name
      t.string :description
      t.integer :assembly_id

      t.timestamps
    end
  end
end
