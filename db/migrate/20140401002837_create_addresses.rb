class CreateAddresses < ActiveRecord::Migration
  def change
    create_table   :addresses do |t|
      t.string     :address
      t.string     :city
      t.string     :country
      t.string     :postal_code
      t.references :province
      t.references :user

      t.timestamps
    end
  end
end
