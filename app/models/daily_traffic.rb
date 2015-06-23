# == Schema Information
#
# Table name: daily_traffics
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  day        :date             not null
#  messages   :integer          default(0), not null
#  megabytes  :float            default(0.0), not null
#  seconds    :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  plan_id    :integer
#

class DailyTraffic < ActiveRecord::Base
  belongs_to :plan
  belongs_to :user
end
