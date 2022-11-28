module API
  module Controllers
    class JobsController < Grape::API
        resource :jobs do
          ###
          # GET '/api/jobs'
          ###
          desc 'Return all Companies'
          get do
            present Job.all
          end

          route_param :id, type: Integer do
            ###
            # GET '/api/jobs/:id'
            ###
            desc 'Return a specific consultant'
            get do
              present Job.find(params[:id])
            end
          end
        end
    end
  end
end
