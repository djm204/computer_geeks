# encoding: UTF-8
#
class Watcheditem < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
end
