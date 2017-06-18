module UsersHelper
	def admin_header
		if @user.admin?
			"ADMIN"
		end
	end
end
