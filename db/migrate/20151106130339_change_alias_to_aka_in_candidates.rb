class ChangeAliasToAkaInCandidates < ActiveRecord::Migration
  def change
    rename_column :candidates, :alias, :aka
    add_column :candidates, :email, :string
  end
end
