# encoding: UTF-8
#
class Address < ActiveRecord::Base
  belongs_to :user
  belongs_to :province

  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :country
  validates_presence_of :postal_code
  validates_presence_of :province

  def to_s
    id.to_s + ' - ' + address
  end
end
