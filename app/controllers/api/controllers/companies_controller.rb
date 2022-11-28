module API
  module Controllers
    class CompaniesController < Grape::API
      resource :companies do
        ###
        # GET '/api/companies'
        ###
        desc 'Return all Companies'
        get do
          present Company.all, with: Entities::Company
        end

        route_param :id do
          ###
          # GET '/api/companies/:id'
          ###
          desc 'Return a specific company'
          get do
            company = Company.find(params[:id])
            present company, with: Entities::Company
          end
        end
      end
    end
  end
end
