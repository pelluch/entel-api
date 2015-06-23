# == Schema Information
#
# Table name: daily_traffics
#
#  id           :integer          not null, primary key
#  plan_type_id :integer
#  user_id      :integer
#  day          :date             not null
#  messages     :integer          default(0), not null
#  megabytes    :float            default(0.0), not null
#  seconds      :integer          default(0), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class DailyTrafficSerializer < ActiveModel::Serializer
  attributes :id, :day, :messages, :megabytes, :seconds
  has_one :plan_type
  has_one :user
end
