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
    check_address_status
    load_cart
    @subtotal = subtotal
    @pst = pst
    @gst = gst
    @hst = hst
    @taxes = taxes
	end

  def check_address_status
    @user = user
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
      subtotal += session[:cart][product.id.to_s] * product.price.to_f
    end
    subtotal.to_f
  end

  def pst
    bill_address.province.pst_rate * subtotal
  end

  def gst
    bill_address.province.gst_rate * subtotal
  end

  def hst
    bill_address.province.hst_rate * subtotal
  end

  def taxes
    (pst + gst + hst).to_f
  end

  def payment
    redirect_to paypal_url('http://localhost:3000')
  end

  def format(amount)
    sprintf("%.2f",amount)
  end

  def paypal_url(return_url)
    values = {:business => 'drewlsvern@gmail.com', :cmd => '_cart',
              :upload => 1, :return => return_url, :invoice => '03TEST'}
    load_cart.each_with_index do |item, index|
      values.merge!({ "amount_#{index+1}"      => format(item.price), 
                      "item_name_#{index+1}"   => item.name,
                      "item_number_#{index+1}" => item.id,
                      "quantity_#{index+1}"    => session[:cart][item.id.to_s]
                    })
    end
    
    # For test transactions use this URL
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
   end
end
