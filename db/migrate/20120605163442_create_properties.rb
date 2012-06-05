class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.integer :property
      t.string :value

      t.timestamps
    end
  end
end
