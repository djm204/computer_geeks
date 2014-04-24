# encoding: UTF-8
#
class Product < ActiveRecord::Base
  belongs_to :category
  mount_uploader :productImage, ProductImageUploader

  validates_presence_of :category_id, :name, :description, :price, :stock_quantity
  validates :stock_quantity, numericality: { only_integer: true }
  validates :price, numericality: { greater_than_or_equal_to: 0 }

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

  def self.verify_product_quantity(id, qty)
    product = Product.find(id)
    if product.stock_quantity < qty.to_i
      true
    else
      false
    end
  end

  def self.update_quantities(session_cart)
    products = Product.where(id: session_cart.keys)
    products.each do |product|
      product.stock_quantity -= session_cart[product.id]
      product.save
    end
  end

  def to_s
    name
  end
end
