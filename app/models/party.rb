class Party < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  acts_as_api

  has_many :candidates

  api_accessible :default do |template|
    template.add :name
    template.add :path
  end

  def path
    "/parties/#{slug}"
  end
end
