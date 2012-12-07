class AddHierarchyToFunction < ActiveRecord::Migration
  def change
    add_column :functions, :level0, :string

    add_column :functions, :level1, :string

    add_column :functions, :level2, :string

    add_column :functions, :level3, :string

    add_column :functions, :level4, :string

    add_column :functions, :leaf, :string

  end
end
