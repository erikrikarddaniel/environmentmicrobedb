class AddSourceDbRankToFunction < ActiveRecord::Migration
  def change
    add_column :functions, :source_db, :string

    add_column :functions, :rank, :string

  end
end
