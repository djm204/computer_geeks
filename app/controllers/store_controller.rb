# encoding: UTF-8
#
class StoreController < ApplicationController
  def search
  end

  def search_results
  	if params[:search_mode] == '1'
      @found_products = Product.keyword_search(params[:search_keywords])
    end

    if params[:search_mode] == '2'
      @found_products = Product.keyword_search_category(params[:search_keywords])
    end
  end
end
