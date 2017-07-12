class ApiKey < ApplicationRecord
	before_save :generate_token
	belongs_to :user
	def generate_token
		loop do
      self.token ||= SecureRandom.base64(64)
      break unless self.class.find_by(token: token)
    end if self.new_record?
	end
end
