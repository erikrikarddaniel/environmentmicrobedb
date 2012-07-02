class CreateSampleProperties < ActiveRecord::Migration
  def change
    create_table :sample_properties do |t|
      t.string :name
      t.string :value

      t.timestamps
    end
  end
end
