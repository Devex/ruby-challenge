module API
  module Controllers
    class Base < Grape::API
      format :json
      prefix :api

      mount CompaniesController
      mount ConsultantsController
      mount JobsController
    end
  end
end
