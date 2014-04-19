# encoding: UTF-8
#
class StoreController < ApplicationController
  def search
  end

  def search_results
  	if params[:search_mode] == '1'
      @found_products = Product.keyword_search(params[:search_keywords]).page(params[:page]).per(3)
      #@found_products = @found_products
    end

    if params[:search_mode] == '2'
      @found_products = Product.keyword_search_category(params[:search_keywords], 
                        params[:search_category]).page(params[:page]).per(3)
    end
  end
end
