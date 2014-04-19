# encoding: UTF-8
#
class Product < ActiveRecord::Base
  belongs_to :category
  mount_uploader :productImage, ProductImageUploader

  def self.keyword_search(keywords)
    keywords = '%' + keywords + '%'
    Product.where('name LIKE ? OR description LIKE ?', keywords, keywords)
  end

  def self.keyword_search_category(keywords)
    keywords = '%' + keywords + '%'
    #Category.where('name LIKE ?', keywords)    
    Product.joins(:category).where('categories.name LIKE ?', keywords)
  end
end
