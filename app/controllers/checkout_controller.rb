# encoding: UTF-8
#
class CheckoutController < ApplicationController
	before_action :authenticate_user!

  def user
    User.find(current_user.id)
  end

  def bill_address
    user.addresses.find(user.default_bill)
  end

	def checkout
    @user = user
    check_address_status(@user)
    @subtotal = subtotal
    @pst = pst
    @gst = gst
    @hst = hst
    @taxes = taxes
	end

  def check_address_status(user)    
    if @user.default_bill.nil? || @user.default_ship.nil?
      flash[:notice] = 'You must add an address before you can continue with checkout!'
      redirect_to addresses_path
    end
  end

  def load_cart
    @products_in_cart = Product.where(id: session[:cart].keys).page(params[:page]).per(3)
  end

  def subtotal
    products = load_cart
    subtotal = 0
    products.each do |product|
      subtotal += session[:cart][product.id.to_i] * product.price.to_f
    end
    subtotal.to_f
  end

  def pst
    bill_address.province.pst_rate
  end

  def gst
    bill_address.province.gst_rate
  end

  def hst
    bill_address.province.hst_rate
  end

  def taxes
    (pst + gst + hst).to_f
  end

  def payment    
    redirect_to paypal_url(populate_order)
  end

  def format(amount)
    sprintf("%.2f",amount)
  end

  def create_order
    current_order = Order.where(session_id:  session[:session_id].to_s)
    if current_order.count == 1
      count = 0
      current_order[0].lineitems.each_with_index do |item, index|
        item.destroy
        count = index
      end
      current_order[0]
    else
      Order.create(user_id: current_user.id, status: 'pending payment', pst_rate: pst, gst_rate: gst, hst_rate: hst, session_id: session[:session_id].to_s)
    end
  end

  def delete_order_session
    current_order = Order.where(session_id: session[:session_id].to_s)
    current_order[0].session_id = ''
    current_order[0].status = 'paid'
    current_order[0].save
  end

  def complete_checkout
    if params[:tx] == session[:session_id].to_s
      Product.update_quantities(session[:cart])
      session.delete(:cart)
      delete_order_session
      flash[:notice] = "Your order was processed sucessfully!"
    else
      flash[:notice] = "Your order wasn't processed please try again!"
    end
  end

  def populate_order
    order = create_order    
    session[:cart].each do |item|
      Lineitem.create(order_id: order.id, product_id: item[0].to_i,
                      quantity: item[1].to_i, price: Product.find(item[0].to_i).price)
    end
    order
  end

  def paypal_url(order)
    return_url = 'http://localhost:3000/store/checkout/complete?tx=' + session[:session_id].to_s
    values = {:business => 'drewlsvern@gmail.com', :cmd => '_cart',
              :upload => 1, :return => return_url, :invoice => order.id}
      values.merge!({ "amount_1"      => format(taxes + subtotal), 
                      "item_name_1"   => 'Computer Geeks Order',
                      "item_number_1" => 'Order #' + order.id.to_s,
                      "quantity_1"    => 1
                    })
    # For test transactions use this URL
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
   end
end
