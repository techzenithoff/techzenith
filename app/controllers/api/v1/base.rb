module API
    module V1
      class Base < Grape::API

        mount API::V1::Auth
        mount API::V1::Signup
        #mount API::V1::Users
        mount API::V1::Sessions
        mount API::V1::Countries
        mount API::V1::Cities
        mount API::V1::Customers
        mount API::V1::Events
        #mount API::V1::Campaigns
        mount API::V1::Accounts
       

      end
    end
end
  