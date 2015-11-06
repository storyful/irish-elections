class AddCandidatesConstituencyId < ActiveRecord::Migration
  def change
    add_column :candidates, :constituency_id, :integer
  end
end
