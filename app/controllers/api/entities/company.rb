module API
  module Entities
    class Company < Grape::Entity
      expose :id
      expose :name
      expose :description
      expose :website
    end
  end
end
