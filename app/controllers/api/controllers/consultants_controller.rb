module API
  module Controllers
    class ConsultantsController < Grape::API
        resource :consultants do
          ###
          # GET '/api/consultants'
          ###
          desc 'Return all Consultants'
          get do
            present Consultant.all, with: Entities::Consultant
          end

          route_param :id, type: Integer do
            ###
            # GET '/api/consultants/:id'
            ###
            desc 'Return a specific Consultant'
            get do
              consultant = Consultant.find(params[:id])
              present consultant, with: Entities::Consultant
            end
          end
        end
    end
  end
end
