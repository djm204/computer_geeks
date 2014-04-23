require 'active_record'
require 'logger'

load 'app/models/product.rb'

ActiveRecord::Base.establish_connection :adapter => 'sqlite3', :database => 'db/development.sqlite3'

#For debugging
#ActiveRecord::Base.logger = Logger.new(STDOUT)
