class CreateProjectProperties < ActiveRecord::Migration
  def change
    create_table :project_properties do |t|
      t.string :name
      t.string :value

      t.timestamps
    end
  end
end
