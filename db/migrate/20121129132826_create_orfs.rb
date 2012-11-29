class CreateOrfs < ActiveRecord::Migration
  def change
    create_table :orfs do |t|
      t.string :name
      t.integer :orf_set_id

      t.timestamps
    end
  end
end
