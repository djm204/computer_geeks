# encoding: UTF-8
#
class Product < ActiveRecord::Base
  belongs_to :category
  mount_uploader :productImage, ProductImageUploader

  def self.keyword_search(keywords)
    keywords = '%' + keywords + '%'
    Product.where('name LIKE ? OR description LIKE ?', keywords, keywords)
  end
end
