class CreateInfoRecords < ActiveRecord::Migration
  def change
    create_table :info_records do |t|
      t.integer :link_id, null: false
      t.integer :user_id, null: false
      t.string :url, null: false
      t.string :slug
      t.boolean :disabled, default: false, null: false

      t.timestamps null: false
    end
  end
end
