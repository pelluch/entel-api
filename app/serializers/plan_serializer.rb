# == Schema Information
#
# Table name: plans
#
#  id             :integer          not null, primary key
#  plan_type_id   :integer
#  name           :text             not null
#  price          :integer          not null
#  internet_price :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class PlanSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :internet_price
  has_one :plan_type
end
