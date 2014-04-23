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
    [['Home', home_path],
     ['Products', products_path],
     ['Categories', categories_path],
     ['Contact', contact_path],
     ['About Us', about_path],
     ['My Account', account_path],
     [check_cart_status, cart_path]]
  end

  def currency(amount)
    format('$%.2f', amount)
  end
end
