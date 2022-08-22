
require 'rails_helper'
require 'spec_helper'

describe API::Controllers::JobsController, type: :request do
  include Rack::Test::Methods

  describe 'GET /api/jobs' do
    let(:n) { 5 }
    let(:jobs) { create_list(:job, n) }
    let(:job_ids) { jobs.map(&:id) }
    let(:http_request) { -> { get('/api/jobs') } }

    before { jobs }

    it 'returns a list of all jobs' do
      http_request.call
      expect(last_response).to be_successful
      expect(parsed_response.size).to eq n
      expect(parsed_response.pluck('id')).to match_array(job_ids)
    end
  end

  describe 'GET /api/jobs/:id' do
    let(:job) do
      create(
        :job,
        name: Faker::Job.title,
        description: 'A very cool job position',
        organization_name: 'Great Company',
        workflow_state: 'published'
      )
    end
    let(:http_request) { -> { get("/api/jobs/#{job.id}") } }

    it 'returns data of a specific job' do
      http_request.call
      expect(last_response).to be_successful
      expect(parsed_response['name']).to eq job.name
      expect(parsed_response['description']).to eq job.description
      expect(parsed_response['organization_name']).to eq job.organization_name
      expect(parsed_response['workflow_state']).to eq job.workflow_state
      expect(parsed_response['company_id']).to eq job.company.id
      expect(parsed_response['employer_company_id']).to eq job.employer_company.id
      expect(parsed_response['consultant_id']).to eq job.consultant.id
      expect(parsed_response['last_updated_by_id']).to eq job.last_updated_by.id
    end
  end
end
