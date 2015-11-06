class AddNewFieldsToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :current_councillor, :boolean, default: false, null: false
    add_column :candidates, :current_senator, :boolean, default: false, null: false
    add_column :candidates, :snapchat_url, :text
    add_column :candidates, :phone_1, :string
    add_column :candidates, :phone_2, :string
  end
end
