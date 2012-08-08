class AddNameOtu < ActiveRecord::Migration
  def change
    add_column :otus, :name, :string
  end

end
