require 'rails_helper'

RSpec.describe 'Parties', type: :request do
  describe 'index' do
    subject { get '/parties.json' }

    it 'gets the list of parties' do
      create(:party)
      subject
      expect(JSON.parse(response.body)['parties'].first).to include_json(name: 'Dictators')
    end
  end

  describe 'show' do
    let(:party) { create(:party) }
    subject { get "/parties/#{party.slug}.json" }

    it 'gets the list of candidates for a party' do
      party.candidates << create(:candidate)
      subject
      expect(JSON.parse(response.body)['candidates'].first).to include_json(first_name: 'John')
    end
  end
end
