class CreateWatcheditems < ActiveRecord::Migration
  def change
    create_table   :watcheditems do |t|
      t.references :product
      t.timestamps :user
    end
  end
end
