class CreateFavoritePrayers < ActiveRecord::Migration
  def change
    create_table :favorite_prayers do |t|
      t.integer :prayer_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
