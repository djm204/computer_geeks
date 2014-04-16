# encoding: UTF-8
#
module AccountHelper
  def orders
    user = User.find(current_user.id)
    begin
      user.orders
    rescue ActiveRecord::RecordNotFound
     'No Orders!'
    end
  end

  def order_amount(order_id)
    user = User.find(current_user.id)

    order = user.orders.find(order_id)
    order_amount = 0

    order.lineitems.each do |p|
      order_amount += p.price.to_f * p.quantity
    end

    taxes = order_amount.to_f * (order.gst_rate + order.pst_rate  + order.hst_rate)
    currency(order_amount + taxes)
  end

  def currency(amount)
    format('$%.2f', amount)
  end
end
