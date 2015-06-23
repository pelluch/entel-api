class AddMinutesAndTrafficToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :minutes, :integer, null: false, default: 0
    add_column :plans, :megabytes, :integer, null: false, default: 0
  end
end
