class CreatePlanTypes < ActiveRecord::Migration
  def change
    create_table :plan_types do |t|
      t.text :name, null: false

      t.timestamps null: false
    end
    add_index :plan_types, :name, unique: true
  end
end
