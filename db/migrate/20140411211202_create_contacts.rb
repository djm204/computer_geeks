class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :page_title
      t.text   :page_left_description
      t.text   :page_right_description
      t.string :image

      t.timestamps
    end
  end
end
