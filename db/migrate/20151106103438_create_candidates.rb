class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :first_name
      t.string :last_name
      t.string :alias, :string
      t.date :date_of_birth
      t.string :gender
      t.boolean :current_td, null: false, default: false
      t.text :photo_url
      t.text :party_profile_url
      t.text :website_url
      t.text :twitter_url
      t.text :facebook_url
      t.text :instagram_url
      t.text :linkedin_url
      t.text :youtube_url
      t.text :source_url
      t.text :voting_record_url
      t.decimal :claimed_expenses, :precision => 9, :scale => 2

      t.timestamps null: false
    end
  end
end
