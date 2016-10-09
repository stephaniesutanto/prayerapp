class CreatePrayers < ActiveRecord::Migration
  def change
    create_table :prayers do |t|
      t.string :name
      t.string :lister
      t.text :description
      t.string :category
      t.boolean :pray
      t.boolean :status
      t.integer :user_id
      t.timestamps null: false
      t.integer :prayer_id
    end
  end
end
