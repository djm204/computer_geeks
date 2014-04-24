# encoding: UTF-8
#
class Order < ActiveRecord::Base
  belongs_to :user
  has_many :lineitems
  has_many :products, through: :lineitems

  scope :pending, where(:status => :new)
  scope :paid, where(:status => :paid)

  validates_presence_of :status, :pst_rate, :gst_rate, :hst_rate
  validates :pst_rate, :gst_rate, :hst_rate, numericality: { greater_than_or_equal_to: 0 }

  def to_s
    'Order id: ' + id.to_s
  end
end
