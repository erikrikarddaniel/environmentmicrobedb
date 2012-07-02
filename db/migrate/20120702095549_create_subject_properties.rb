class CreateSubjectProperties < ActiveRecord::Migration
  def change
    create_table :subject_properties do |t|
      t.string :name
      t.string :value

      t.timestamps
    end
  end
end
