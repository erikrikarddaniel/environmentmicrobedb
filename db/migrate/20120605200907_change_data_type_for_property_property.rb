class ChangeDataTypeForPropertyProperty < ActiveRecord::Migration
  def up
    change_table :properties do |t|
      t.change :property, :string
    end
  end

  def down
    change_table :properties do |t|
      t.change :property, :integer
    end
  end
end
