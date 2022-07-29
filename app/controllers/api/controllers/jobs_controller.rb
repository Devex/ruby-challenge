module API
  module Controllers
    class JobsController < Grape::API
        resource :jobs do
          desc 'Return all Companies'
          ###
          # GET '/api/jobs'
          ###
          get do
            present Job.all
          end

          desc 'Return a specific consultant'
          route_param :id do
            ###
            # GET '/api/jobs/:id'
            ###
            get do
              present Job.find(params[:id])
            end
          end
        end
    end
  end
end
