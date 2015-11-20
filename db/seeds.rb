# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ActiveRecord::Base.connection.execute("truncate constituencies, candidates, parties restart identity")

AdminUser.create!(email: 'ied@storyful.com', password: 'password', password_confirmation: 'password') if AdminUser.count == 0

constituencies = CSV.foreach("#{Rails.root}/db/data/constituencies.csv").map { |name, seats| { name: name, num_seats: seats } }
Constituency.create constituencies

parties = CSV.foreach("#{Rails.root}/db/data/parties.csv").map { |name, seats| { name: name } }
Party.create parties


extract_handle = ->(source) { source.to_s.split(".com/").last.to_s.split("@").last }

candidates = CSV.foreach("#{Rails.root}/db/data/candidates.csv").map do |timestamp, first_name, last_name, aka, party, constituency , website, profile, email, kildare_street_source, is_td, image, facebook, twitter, linkedin, youtube, snapchat, instagram, phone_1, phone_2, gender, source, is_councillor, dob, is_senator, expenses|
  next if first_name.blank? || first_name == 'First name'  
  constituency_fixed = constituency.to_s.gsub(/Dublin South Central/, 'Dublin South–Central')
  fields = {
    first_name: first_name,
    last_name: last_name,
    aka: aka,
    email: email,
    date_of_birth: dob,
    gender: gender,
    phone_1: phone_1,
    phone_2: phone_2,
    current_td: is_td == 'Yes',
    current_councillor: is_councillor == 'Yes',
    current_senator: is_senator == 'Yes',
    photo_url: image,
    party_profile_url: profile,
    website_url: website,
    twitter_handle: extract_handle.call(twitter),
    facebook_url: facebook,
    instagram_url: instagram,
    snapchat_url: snapchat,
    linkedin_url: linkedin,
    youtube_url: youtube,
    source_url: source,
    voting_record_url: kildare_street_source,
    claimed_expenses: expenses.to_s.gsub(/[^.0-9]/, ''),
    party: Party.find_by(name: party),
    constituency: Constituency.find_by(name: constituency_fixed)
  }
end

Candidate.create candidates.compact
