module API
	class Api < Grape::API
		version 'v1', using: :path
    format :json
    prefix :api

    helpers do
    	def authenticate!
    		token = request.headers["Access-Token"]
    		api_key = ApiKey.find_by_token(token)
    		
    		error!(message: "Invalid Access Token") unless api_key
    		@current_user ||= api_key.user
    	end

    	def current_user
    		@current_user
    	end
    end
    mount API::V1::Auth
   	mount API::V1::ItemApi

   	add_swagger_documentation
	end
end