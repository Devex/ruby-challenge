module API
  class Base < Grape::API
    mount API::Controllers::Base
  end
end
