load 'ar.rb'

session = Array.new

session[0] = {1 => '10', 2 => '15'}

products = Product.where(id: session[0].keys)

session[0].each do |qty|
  puts qty[1]
end


# products.each do |product|
#   puts "Old Stock Qty for #{product.name}:  #{product.stock_quantity}"
#   puts
#   product.stock_quantity = product.stock_quantity - session[0][product.id].to_i
#   product.save
#   puts "New Stock Qty for #{product.name}:  #{product.stock_quantity}"
# end

p products.class

#product 1 current = 10 "GA-B85M-D3H"
#product 2 current = 15 "B85M-E /CSM"