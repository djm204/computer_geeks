class User < ActiveRecord::Base
	has_many :orders
	has_many :addresses

	validates :first_name, presence: true
	validates :last_name , presence: true
	validates :email     , presence: true

	def to_s
  	first_name + " " + last_name + " - " + id.to_s
  end
end
