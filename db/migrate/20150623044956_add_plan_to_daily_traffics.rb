class AddPlanToDailyTraffics < ActiveRecord::Migration
  def change
    add_reference :daily_traffics, :plan, index: true, foreign_key: true
  end
end
