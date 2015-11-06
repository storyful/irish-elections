# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ActiveRecord::Base.connection.execute("truncate constituencies")

AdminUser.create!(email: 'ied@storyful.com', password: 'password', password_confirmation: 'password') if AdminUser.count == 0

constituencies = CSV.foreach("#{Rails.root}/db/data/constituencies.csv").map { |name, seats| { name: name, num_seats: seats } }

Constituency.create constituencies

['Fianna Fàil', 'Fine Gael', 'Labour Party', 'Sinn Féin', 'Renua', 'Green Party', 'Social Democrats', 'The Socialist Party', 'The Workers\' Party', 'Communist Party of Ireland', 'Stop the Water Tax - Socialist', 'Independent'].each do |party|
  Party.create(name: party)
end
