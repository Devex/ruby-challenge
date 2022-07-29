
require 'rails_helper'
require 'spec_helper'

describe API::Controllers::ConsultantsController, type: :request do
  include Rack::Test::Methods

  describe 'GET /api/consultants' do
    let(:n) { 5 }
    let(:consultants) { create_list(:consultant_with_company, n) }
    let(:consultant_ids) { consultants.map(&:id) }
    let(:http_request) { -> { get('/api/consultants') } }

    before { consultants }

    it 'returns a list of all consultants' do
      http_request.call
      expect(last_response).to be_successful
      expect(parsed_response.size).to eq n
      expect(parsed_response.pluck('id')).to match_array(consultant_ids)
    end
  end

  describe 'GET /api/consultants/:id' do
    let(:consultant) do
      create(
        :consultant_with_company,
        headline: 'a very cool headline',
        title: 'Software Engineer'
      )
    end
    let(:http_request) { -> { get("/api/consultants/#{consultant.id}") } }

    it 'returns data of a specific consultant' do
      http_request.call
      expect(last_response).to be_successful
      expect(parsed_response['first_name']).to eq consultant.first_name
      expect(parsed_response['last_name']).to eq consultant.last_name
      expect(parsed_response['headline']).to eq consultant.headline
      expect(parsed_response['title']).to eq consultant.title
    end
  end
end
