class CreateAbouts < ActiveRecord::Migration
  def change
    create_table :abouts do |t|
      t.string :index

      t.timestamps
    end
  end
end
