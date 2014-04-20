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

  def cart
    if session[:cart].nil?
      @product_id = params[:product_id]
      if @product_id.nil? == false
        session[:cart] = {@product_id => params[:qty].to_i}
      end
    else
      #delete
      add_to_cart
    end
  end

  def add_to_cart
    @product_id = params[:product_id]
     if session[:cart][@product_id].nil? == false
       session[:cart][@product_id] += params[:qty].to_i
     elsif @product_id.nil? == false
       session[:cart][@product_id] = params[:qty].to_i
     end
  end

  def delete
    session.delete(:cart)
  end
end