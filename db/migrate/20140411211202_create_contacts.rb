class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :index

      t.timestamps
    end
  end
end
