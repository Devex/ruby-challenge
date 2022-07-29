module API
  module Controllers
    class ConsultantsController < Grape::API
        resource :consultants do
          desc 'Return all Consultants'
          ###
          # GET '/api/consultants'
          ###
          get do
            present Consultant.all
          end

          desc 'Return a specific Consultant'
          route_param :id do
            ###
            # GET '/api/consultants/:id'
            ###
            get do
              present Consultant.find(params[:id])
            end
          end
        end
    end
  end
end
