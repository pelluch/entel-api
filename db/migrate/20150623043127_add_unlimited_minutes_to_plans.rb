class AddUnlimitedMinutesToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :unlimited_minutes, :boolean, null: false, default: false
  end
end
