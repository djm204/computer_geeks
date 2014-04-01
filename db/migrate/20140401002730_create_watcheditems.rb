class CreateWatcheditems < ActiveRecord::Migration
  def change
    create_table :watcheditems do |t|

      t.timestamps
    end
  end
end
