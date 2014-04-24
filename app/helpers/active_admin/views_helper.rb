# encoding: UTF-8
#
module ActiveAdmin
#
  module ViewsHelper
    def country_dropdown
      ActionView::Helpers::FormOptionsHelper::COUNTRIES
    end
      
    #Order Helpers
    def user(order)
      User.find(order.user_id)
    end

    def order
      Order.find(params[:id])
    end

    def bill_address
      user(order).addresses.find(user(order).default_bill)
    end

    def ship_address
      user(order).addresses.find(user(order).default_ship)
    end

    def lineitems(id)
      Lineitem.where("order_id = " + id.to_s)
    end
    
    def subtotal(id)
      subtotal = lineitems(id).calculate(:sum, :price)
    end

    def gst
      order.gst_rate
    end

    def pst
      order.pst_rate
    end

    def hst
      order.hst_rate 
    end

    def taxes(order)
      order.gst_rate + order.pst_rate + order.hst_rate
    end

    def calculate_order_total(id)
      order = Order.find(id)             
      subtotal(id) * (1+ taxes(order))
    end
  end
end
