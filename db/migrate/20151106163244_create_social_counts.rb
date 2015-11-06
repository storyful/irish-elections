class CreateSocialCounts < ActiveRecord::Migration
  def change
    create_table :social_counts do |t|
      t.references :candidate
      t.integer :twitter_followers_count
      t.date :date
      t.timestamps
    end

    add_index :social_counts, [:candidate_id, :date], unique: true
  end
end
