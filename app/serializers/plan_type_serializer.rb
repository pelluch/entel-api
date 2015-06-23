# == Schema Information
#
# Table name: plan_types
#
#  id         :integer          not null, primary key
#  name       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PlanTypeSerializer < ActiveModel::Serializer
  attributes :id, :name
end
