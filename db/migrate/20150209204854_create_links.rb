class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.integer :user_id, null: false
      t.string :url, null: false
      t.string :slug, unique: true
      t.boolean :disabled, default: false, null: false

      t.timestamps null: false
    end
  end
end
