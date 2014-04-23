# encoding: UTF-8
#
class Lineitem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  validates_presence_of :order_id, :product_id, :quantity, :price
  validates :quantity, numericality: { only_integer: true }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  
end
