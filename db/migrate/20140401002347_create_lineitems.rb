class CreateLineitems < ActiveRecord::Migration
  def change
    create_table   :lineitems do |t|
      t.integer    :quantity
      t.decimal    :price
      t.references :product
      t.references :order

      t.timestamps
    end
  end
end
