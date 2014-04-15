module AccountHelper
	def get_Orders
		user_id = current_user.id

		begin
			orders = Order.find(user_id)
		rescue ActiveRecord::RecordNotFound			
			orders = "No Orders!"
		end
	end
end
