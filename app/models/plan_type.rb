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

	validates_presence_of [ :name ]
	validates_uniqueness_of [ :name ]
	accepts_nested_attributes_for :plans


end
