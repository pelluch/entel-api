class RemovePlanTypeReferenceToDailyTraffics < ActiveRecord::Migration
  def change
    remove_reference :daily_traffics, :plan_type, index: true, foreign_key: true
  end
end
