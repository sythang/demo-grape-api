module API::V1
	class Auth < Grape::API
		#GET api/v1/users
		# resouces :users do
		# 	get do
		# 	end

		# 	namespace ":id" do
		# 		params do
		# 			requires :id, type: Integer
		# 		end
		# 		#GET api/v1/users/1
		# 		get do
		# 			#get details
		# 		end
		# 		#PUT
		# 		put do
		# 		end

		# 		delete do
		# 		end
		# 	end
			
		# end

		resource :auth do

			desc "API for login" do
				success User::BaseEntity
			end
			params do
				requires :email, type: String
				requires :password, type: String
			end
			post :login do
				user = User.find_by_email(params[:email])
				if user.present? && user.valid_password?(params[:password])
					present :status, true
					present user, with: User::BaseEntity
				else
					present :status, false
					present :message, "Invalid email or password"
				end
		  end

		end
		

	end
end