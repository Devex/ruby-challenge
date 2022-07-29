module API
  module Controllers
    class CompaniesController < Grape::API
      resource :companies do
        desc 'Return all Companies'
        ###
        # GET '/api/companies'
        ###
        get do
          present Company.all, with: Entities::Company
        end

        desc 'Return a specific company'
        route_param :id do
          ###
          # GET '/api/companies/:id'
          ###
          get do
            company = Company.find(params[:id])
            present company, with: Entities::Company
          end
        end
      end
    end
  end
end
