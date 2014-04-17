# encoding: UTF-8
#
module ApplicationHelper
  def active?(current_location, url, css_class_name)
    current_location.include?(url) ? css_class_name : nil
  end

  def check_cart_status
    if session[:cart].nil?
      'Cart (0 Items)'
    else
      "Cart (#{session[:cart].count}) Items"
    end
  end

  def nav_items
    [['Home', '/index'],
     ['Products', '/products'],
     ['Contact', '/contact'],
     ['About Us', '/about'],
     ['My Account', '/account'],
     [check_cart_status, '/cart']]
  end

  def currency(amount)
    format('$%.2f', amount)
  end
end
