class User
	class BaseEntity < Grape::Entity
		root 'users', 'user'
		expose :email, documentation: { type: "String" }
		expose :full_name, documentation: { type: "String" }
		expose :phone_number, documentation: { type: "String" }
		expose :id, documentation: { type: "String" }
		expose :api_key, documentation: {type: "String"}
	end
end