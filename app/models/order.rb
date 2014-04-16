# encoding: UTF-8
#
class Order < ActiveRecord::Base
  belongs_to :user
  has_many :lineitems
  has_many :products, through: :lineitems

  def to_s
    'Order id: ' + id.to_s
  end
end
