module API::V1
	class ItemApi < Grape::API
		resource :items do
			before { authenticate! }
			get do
				items = current_user.items
				present items, with: Item::BaseEntity
			end
		end
	end
end