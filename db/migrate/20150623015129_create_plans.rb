class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.references :plan_type, index: true, foreign_key: true
      t.text :name, null: false
      t.integer :price, null: false
      t.integer :internet_price, null: false

      t.timestamps null: false
    end
    add_index :plans, [ :plan_type_id, :name ], unique: true
  end
end
