class Constituency < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  acts_as_api

  has_many :candidates

  api_accessible :default do |template|
    template.add :id
    template.add :slug
    template.add :name
    template.add :path
  end

  def path
    "/constituencies/#{slug}"
  end
end
