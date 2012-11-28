class CreateOrfAas < ActiveRecord::Migration
  def change
    create_table :orf_aas do |t|
      t.string :identifier
      t.integer :assembly_id

      t.timestamps
    end
  end
end
