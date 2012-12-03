class CreateFunctions < ActiveRecord::Migration
  def change
    create_table :functions do |t|
      t.string :name
      t.integer :parent_id
      t.integer :annotation_source_id

      t.timestamps
    end
  end
end
