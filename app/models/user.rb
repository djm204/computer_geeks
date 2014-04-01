class User < ActiveRecord::Base
	has_many :orders
	has_many :addresses

	def to_s
  	first_name + " " + last_name + " - " + id.to_s
  end
end
