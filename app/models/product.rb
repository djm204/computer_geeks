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
end
