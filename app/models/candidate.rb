class Candidate < ActiveRecord::Base
  extend FriendlyId
  acts_as_api
  belongs_to :constituency
  belongs_to :party
  friendly_id :slug_candidates, use: :slugged

  api_accessible :default do |template|
    template.add :first_name
    template.add :last_name
    template.add :path
  end

  def slug_candidates
    [
      [:first_name, :last_name],
      [:first_name, :last_name, :id]
    ]
  end

  def label
    [first_name, last_name].join(' ')
  end

  def path
    "/candidates/#{slug}"
  end
end
