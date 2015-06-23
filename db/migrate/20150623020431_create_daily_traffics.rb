class CreateDailyTraffics < ActiveRecord::Migration
  def change
    create_table :daily_traffics do |t|
      t.references :plan_type, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.date :day, null: false
      t.integer :messages, null: false, default: 0
      t.float :megabytes, null: false, default: 0
      t.integer :seconds, null: false, default: 0

      t.timestamps null: false
    end
  end
end
