# encoding: UTF-8
#
class Product < ActiveRecord::Base
  belongs_to :category
  mount_uploader :productImage, ProductImageUploader
end
