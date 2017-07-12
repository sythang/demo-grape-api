class Item
	class BaseEntity < Grape::Entity
		root 'items', 'item'
		expose :id, :name, :created_at
	end
end