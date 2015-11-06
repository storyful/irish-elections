class AddSlugToConstituencies < ActiveRecord::Migration
  def change
    add_column :constituencies, :slug, :string, unique: true
  end
end
