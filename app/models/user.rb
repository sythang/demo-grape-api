class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
 

  has_many :items
  has_many :api_keys

  def api_key
  	unless self.api_keys.any?
  		self.api_keys.create
  	end
  	api_keys.last.token
  end
end
