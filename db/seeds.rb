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

candidates = CSV.foreach("#{Rails.root}/db/data/candidates.csv").map { |name, seats| { name: name } }
Candidate.create candidates
