class Candidate < ActiveRecord::Base
  acts_as_api
  belongs_to :constituency
  belongs_to :party
  
  api_accessible :default do |template|
    template.add :first_name
    template.add :last_name
  end

  def label
    [first_name, last_name].join(' ')
  end
end
