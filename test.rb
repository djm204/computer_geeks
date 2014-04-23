load 'ar.rb'


categories = Category.all

categories.each do |c|
  
  puts c.name
  puts 

  c.products.each do |p|
    puts p.name
  end
  puts
  
end