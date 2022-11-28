module API
  module Entities
    class Consultant < Grape::Entity
      expose :id
      expose :first_name
      expose :last_name
      expose :headline
      expose :title
      expose :data_completeness
      expose :specialties
      expose :who_am_i
      expose :company, using: Company
    end
  end
end
