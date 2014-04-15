module AccountHelper

	def get_Orders
		user = User.find(current_user.id)
		begin
			orders = user.orders
		rescue ActiveRecord::RecordNotFound			
			orders = "No Orders!"
		end
	end

	def get_Order_Amount(order_id)
		user = User.find(current_user.id)

		order = user.orders.find(order_id)
		orderAmount = 0
		
		order.lineitems.each do |p|
		  orderAmount += p.price.to_f * p.quantity
		end

		 taxes = orderAmount.to_f * (order.gst_rate + order.pst_rate  + order.hst_rate)
		 currency(orderAmount + taxes)
	end

	def currency(amount)
   sprintf("$%.2f",amount)
  end
end
