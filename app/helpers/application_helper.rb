module ApplicationHelper
	def get_current_users_first_name
		current_user.name.gsub(/\s.+/, "")
	end
end
