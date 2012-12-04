class AddSourceIdentifierToFunction < ActiveRecord::Migration
  def change
    add_column :functions, :source_identifier, :string

  end
end
