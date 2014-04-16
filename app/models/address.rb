# encoding: UTF-8
#
class Address < ActiveRecord::Base
  belongs_to :user
  belongs_to :province

  def to_s
    id.to_s + ' - ' + address
  end
end
