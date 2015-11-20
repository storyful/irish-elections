class ConvertTwitterUrlToTwitterHandle < ActiveRecord::Migration
  def change
    rename_column :candidates, :twitter_url, :twitter_handle
  end
end
