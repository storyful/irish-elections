class AddSlugToParties < ActiveRecord::Migration
  def change
    add_column :parties, :slug, :string, unique: true
  end
end
