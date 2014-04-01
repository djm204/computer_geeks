class Product < ActiveRecord::Base
	belongs_to :line_item
	belongs_to :watcheditem
	has_many   :categories
end
