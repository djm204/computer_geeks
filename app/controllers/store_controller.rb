# encoding: UTF-8
#
class StoreController < ApplicationController
  def search
  end

  def search_results
    if params[:search_mode] == '1'
      @found_products = Product.keyword_search(params[:search_keywords]).page(params[:page]).per(3)
    end

    if params[:search_mode] == '2'
      @found_products = Product.keyword_search_category(params[:search_keywords],
                                                        params[:search_category]).page(params[:page]).per(3)
    end
  end

  def cart #runs on 'get' cart
    if session[:cart].nil?
      @product_id = params[:product_id]
      @qty        = params[:qty]
      if @product_id.nil? == false
        session[:cart] = {@product_id => @qty.to_i}
        load_cart
      end
    else
      #delete
      add_to_cart
    end
  end

  def add_to_cart # runs only on 'post'
    @product_id = params[:product_id]
    @qty        = params[:qty]
     if @product_id.nil? == false
       session[:cart][@product_id] = @qty.to_i
     end
     load_cart
  end

  def load_cart
    @products_in_cart = Product.where(id: session[:cart].keys).page(params[:page]).per(3)
  end

  def delete_cart_session
    if session[:cart].count == 0
      session.delete(:cart)
    end    
  end

  def remove_cart_item
    product = Product.find(params[:id])
    flash[:notice] = "Product #{product.name} was successfully removed from your cart!"
    session[:cart].delete(params[:id])
    delete_cart_session
    redirect_to cart_path
  end
end