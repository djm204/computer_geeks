# encoding: UTF-8
#
class Address < ActiveRecord::Base
  belongs_to :user
  belongs_to :province

  validates_presence_of :address, :city, :country, :province_id, :postal_code

  def to_s
    id.to_s + ' - ' + address
  end
end
