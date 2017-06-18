module AttractionsHelper
	def show_attraction_link_text(user, attraction)
		# binding.pry
		user.nil? || !user.admin? ?  "Go on #{attraction.name}" : "Show #{attraction.name}"
	end

	def attraction_submit_text(attraction)
		attraction.id ? "Update Attraction" : "Create Attraction"
	end
end
