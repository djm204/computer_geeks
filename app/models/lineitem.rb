# encoding: UTF-8
#
class Lineitem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
end
