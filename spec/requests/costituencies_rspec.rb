require 'rails_helper'

RSpec.describe 'Constituencies', type: :request do
  describe 'index' do
    subject { get '/constituencies.json' }

    it 'gets the list of candidates' do
      create(:constituency)
      subject
      expect(JSON.parse(response.body)['constituencies'].first).to include_json(name: 'Dublin')
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
