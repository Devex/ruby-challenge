
require 'rails_helper'
require 'spec_helper'

describe API::Controllers::CompaniesController, type: :request do
  include Rack::Test::Methods

  describe 'GET /api/companies' do
    let(:n) { 5 }
    let(:companies) { create_list(:company, n) }
    let(:company_ids) { companies.map(&:id) }
    let(:http_request) { -> { get('/api/companies') } }

    before { companies }

    it 'returns a list of all companies' do
      http_request.call
      expect(last_response).to be_successful
      expect(parsed_response.size).to eq n
      expect(parsed_response.pluck('id')).to match_array(company_ids)
    end
  end

  describe 'GET /api/companies/:id' do
    let(:company) do
      create(
        :company,
        description: 'test description',
        website: 'http://www.example.org'
      )
    end
    let(:http_request) { -> { get("/api/companies/#{company.id}") } }

    it 'returns data of a specific company' do
      http_request.call
      expect(last_response).to be_successful
      expect(parsed_response['name']).to eq company.name
      expect(parsed_response['description']).to eq company.description
      expect(parsed_response['website']).to eq company.website
    end
  end
end
