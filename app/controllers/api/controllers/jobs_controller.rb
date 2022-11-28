module API
  module Controllers
    class JobsController < Grape::API
        resource :jobs do
          ###
          # GET '/api/jobs'
          ###
          desc 'Return all Companies'
          get do
            present Job.all, with: Entities::Job
          end

          route_param :id, type: Integer do
            ###
            # GET '/api/jobs/:id'
            ###
            desc 'Return a specific consultant'
            get do
              job = Job.find(params[:id])
              present job, with: Entities::Job
            end
          end
        end
    end
  end
end
