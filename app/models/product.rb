# encoding: UTF-8
#
class Product < ActiveRecord::Base
  belongs_to :category
  mount_uploader :productImage, ProductImageUploader

  def self.keyword_search(keywords)
    Product.where('name LIKE ? OR description LIKE ?', keywords(keywords), keywords(keywords))
  end

  def self.keyword_search_category(keywords)
    Product.joins(:category).where('categories.name LIKE ?', keywords(keywords))
  end
  
  private

  def self.keywords(keywords)
    keywords = '%' + keywords + '%'
  end
end
