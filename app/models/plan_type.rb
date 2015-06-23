# == Schema Information
#
# Table name: plan_types
#
#  id         :integer          not null, primary key
#  name       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PlanType < ActiveRecord::Base
	has_many :plans
end
