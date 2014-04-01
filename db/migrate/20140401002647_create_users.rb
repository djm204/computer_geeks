class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :password
      t.string   :first_name
      t.string   :last_name
      t.integer  :default_ship
      t.integer  :default_bill
      t.string   :email
      t.string   :active

      t.timestamps
    end
  end
end
