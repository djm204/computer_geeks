module ApplicationHelper
	def is_active(current_location,url)       
    current_location.include?(url) ? "active" : nil        
  end
end
