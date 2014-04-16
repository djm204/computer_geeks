class CreateAbouts < ActiveRecord::Migration
  def change
    create_table :abouts do |t|
      t.string :page_title
      t.text   :page_left_description
      t.text   :page_right_description
      t.string :image

      t.timestamps
    end
  end
end
