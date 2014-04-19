# encoding: UTF-8
#
class StoreController < ApplicationController
  def search
  end

  def search_results
    @found_products = Product.keyword_search(params[:search_keywords])
  end
end
