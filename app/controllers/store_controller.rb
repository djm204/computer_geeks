# encoding: UTF-8
#
class StoreController < ApplicationController
  def search
  end

  def search_results
    if params[:search_mode] == '1'
      @found_products = Product.keyword_search(params[:search_keywords]).page(params[:page]).per(5)
    end

    if params[:search_mode] == '2'
      @found_products = Product.keyword_search_category(params[:search_keywords],
                                                        params[:search_category]).page(params[:page]).per(5)
    end
  end

  def cart
    if params[:product_id] != nil && session[:cart].nil?
      product_id = params[:product_id]
      session[:cart] = {product_id.to_i => params[:qty].to_i}
      load_cart
    else
      add_to_cart
    end    
  end

  def add_to_cart
     if params[:product_id] != nil
       product_id = params[:product_id]
       session[:cart][product_id.to_i] = params[:qty].to_i    
     end
     load_cart
  end

  def load_cart
    if session[:cart] != nil
      verify_product_quantity unless params[:product_id].nil?
      @products_in_cart = Product.where(id: session[:cart].keys).page(params[:page]).per(3)
    end
  end

  def delete_cart_session
     session.delete(:cart)
     redirect_to cart_path
  end

  def remove_cart_item
    product = Product.find(params[:id].to_i)
    flash[:notice] = "Product #{product.name} was successfully removed from your cart!"
    session[:cart].delete(params[:id].to_i)
    check_session_status
  end

  def check_session_status
    if session[:cart].count == 0     
      delete_cart_session
    else
      redirect_to cart_path
    end
  end

  def verify_product_quantity
    product_id = params[:product_id]
    if Product.verify_product_quantity(product_id.to_i,params[:qty].to_i)
      flash[:alert] = "Quantity selected for product #{Product.find("#{params[:product_id]}").name} 
                       is greater than our current stock, please adjust order quantity and try again!"
      redirect_to session[:previous_url]
    end
  end
end