module API
  module Controllers
    class ConsultantsController < Grape::API
        resource :consultants do
          ###
          # GET '/api/consultants'
          ###
          desc 'Return all Consultants'
          get do
            present Consultant.all
          end

          route_param :id, type: Integer do
            ###
            # GET '/api/consultants/:id'
            ###
            desc 'Return a specific Consultant'
            get do
              present Consultant.find(params[:id])
            end
          end
        end
    end
  end
end
