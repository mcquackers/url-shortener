class CreateClicks < ActiveRecord::Migration
  def change
    create_table :clicks do |t|
      t.integer :link_id, null: false

      t.timestamps null: false
    end
  end
end
