require 'rails_helper'

RSpec.describe 'Parties', type: :request do
  subject { get '/parties.json' }

  it 'gets the list of parties' do
    create(:party)
    subject
    expect(JSON.parse(response.body).first).to include_json(name: 'Dictators')
  end
end
