class CreatePrayerGroups < ActiveRecord::Migration
  def change
    create_table :prayer_groups do |t|
      t.references :prayer, index: true, foreign_key: true
      t.references :group, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
