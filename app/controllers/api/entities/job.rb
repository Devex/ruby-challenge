module API
  module Entities
    class Job < Grape::Entity
      expose :id
      expose :name
      expose :description
      expose :published_at
      expose :closing_date
      expose :is_featured
      expose :is_remote
      expose :company, using: Company
      expose :consultant, using: Consultant
    end
  end
end
