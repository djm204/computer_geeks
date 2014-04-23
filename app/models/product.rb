# encoding: UTF-8
#
class Product < ActiveRecord::Base
  belongs_to :category
  mount_uploader :productImage, ProductImageUploader

  def self.keyword_search(keywords)
    Product.where('name LIKE ? OR description LIKE ?', keywords(keywords), keywords(keywords))
  end

  def self.keyword_search_category(keywords, category_name)
    Product.joins(:category).where("categories.name ='" + category_name +
                                   "' AND (products.name LIKE ? OR description LIKE ?)",
                                   keywords(keywords), keywords(keywords))
  end

  def self.keywords(keywords)
    '%' + keywords + '%'
  end

  # def paypal_url(return_url)
  #   values = {
  #   :business => 'drewlsvern@gmail.com',
  #   :cmd => '_cart',
  #   :upload => 1,
  #   :return => return_url,
  #   :invoice => '01TEST'
  #   } 
  #   values.merge!({ 
  #     "amount_1" => subtotal,
  #     "item_name_1" => user.first_name,
  #     "item_number_1" => user.id,
  #     "quantity_1" => '1'
  #   })
  #   # For test transactions use this URL
  #   "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  #  end
end
