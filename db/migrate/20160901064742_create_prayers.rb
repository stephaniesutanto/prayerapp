class CreatePrayers < ActiveRecord::Migration
  def change
    create_table :prayers do |t|
      t.string :name
      t.text :description
      t.string :category
      t.boolean :pray
      t.boolean :status

      t.timestamps null: false
    end
  end
end
