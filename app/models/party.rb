class Party < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  acts_as_api

  api_accessible :default do |template|
    template.add :name
    template.add :url
  end

  def url
    "/parties/#{slug}.json"
  end
end
