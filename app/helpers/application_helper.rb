module ApplicationHelper
	def is_active(current_location,url,css_class_name)       
    current_location.include?(url) ? css_class_name : nil        
  end

  def get_Nav_Items()    
    navItems = [["Home", "/index"]         , 
    						["Products", "/products"]  , 
    						["Contact", "/contact"]    ,
    						["About Us", "/about"]     ,
    						["My Account", account_path] ,
    						["Cart", "/cart"]]
  end
end