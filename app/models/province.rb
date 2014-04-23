# encoding: UTF-8
#
class Province < ActiveRecord::Base
  has_many :addresses

  validates_presence_of :name, :pst_rate, :gst_rate, :hst_rate
  validates :pst_rate, :gst_rate, :hst_rate, numericality: { greater_than_or_equal_to: 0 }

  def to_s
    name
  end
end
