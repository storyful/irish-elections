class DropCandidatesString < ActiveRecord::Migration
  def up
    remove_column :candidates, :string
  end
end
