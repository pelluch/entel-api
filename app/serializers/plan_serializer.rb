# == Schema Information
#
# Table name: plans
#
#  id                :integer          not null, primary key
#  plan_type_id      :integer
#  name              :text             not null
#  price             :integer          not null
#  internet_price    :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  minutes           :integer          default(0), not null
#  megabytes         :integer          default(0), not null
#  unlimited_minutes :boolean          default(FALSE), not null
#

class PlanSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :internet_price,
  :plan_type_id, :unlimited_minutes, :minutes,
  :megabytes
end
