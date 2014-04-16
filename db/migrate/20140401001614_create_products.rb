class CreateProducts < ActiveRecord::Migration
  def change
    create_table   :products do |t|
      t.string     :name
      t.text       :description
      t.decimal    :price
      t.integer    :stock_quantity
      t.string     :productImage
      t.references :category

      t.timestamps
    end
  end
end
