class User < ActiveRecord::Base
	has_many :rides
	has_many :attractions, through: :rides

	has_secure_password

	def mood
		if self.happiness < self.nausea
			return "sad"
		elsif self.happiness > self.nausea
			return "happy"
		end
	end

	def admin?
		self.admin == true
	end
end
