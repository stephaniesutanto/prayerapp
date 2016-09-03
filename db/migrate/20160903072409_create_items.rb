class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :prayer_id
      t.integer :user_id
      t.boolean :add

      t.timestamps null: false
    end
  end
end
