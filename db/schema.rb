# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151106103438) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidates", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "alias"
    t.string   "string"
    t.date     "date_of_birth"
    t.string   "gender"
    t.boolean  "current_td",                                default: false, null: false
    t.text     "photo_url"
    t.text     "party_profile_url"
    t.text     "website_url"
    t.text     "twitter_url"
    t.text     "facebook_url"
    t.text     "instagram_url"
    t.text     "linkedin_url"
    t.text     "youtube_url"
    t.text     "source_url"
    t.text     "voting_record_url"
    t.decimal  "claimed_expenses",  precision: 9, scale: 2
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
  end

end
